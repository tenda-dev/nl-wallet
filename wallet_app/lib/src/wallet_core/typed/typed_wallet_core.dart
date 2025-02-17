import 'dart:async';
import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wallet_core/core.dart';

import '../../util/mapper/mapper.dart';
import '../error/core_error.dart';
import '../error/flutter_api_error.dart';

/// Wraps the [WalletCore].
/// Adds auto initialization, pass through of the locked
/// flag and parsing of the [FlutterApiError]s.
class TypedWalletCore {
  final WalletCore _walletCore;
  final Mapper<String, CoreError> _errorMapper;
  final Completer _isInitialized = Completer();
  final BehaviorSubject<bool> _isLocked = BehaviorSubject.seeded(true);
  final BehaviorSubject<FlutterConfiguration> _flutterConfig = BehaviorSubject();
  final BehaviorSubject<List<WalletEvent>> _recentHistory = BehaviorSubject();
  final BehaviorSubject<List<Card>> _cards = BehaviorSubject();

  TypedWalletCore(this._walletCore, this._errorMapper) {
    _initWalletCore();
    _setupLockedStream();
    _setupConfigurationStream();
    _setupCardsStream();
    _setupRecentHistoryStream();
  }

  void _initWalletCore() async {
    if ((await _walletCore.isInitialized()) == false) {
      // Initialize the Asynchronous runtime and the wallet itself.
      // This is required to call any subsequent API function on the wallet.
      await _walletCore.init();
    } else {
      // The wallet_core is already initialized, this can happen when the Flutter
      // engine/activity was killed, but the application (and thus native code) was
      // kept alive by the platform. To recover from this we make sure the streams are reset,
      // as they can contain references to the previous Flutter engine.
      await _walletCore.clearLockStream();
      await _walletCore.clearConfigurationStream();
      await _walletCore.clearCardsStream();
      await _walletCore.clearRecentHistoryStream();
      // Make sure the wallet is locked, as the [AutoLockObserver] was also killed.
      await _walletCore.lockWallet();
    }
    _isInitialized.complete();
  }

  void _setupLockedStream() {
    _isLocked.onListen = () async {
      await _isInitialized.future;
      _walletCore.setLockStream().listen((event) => _isLocked.add(event));
    };
    _isLocked.onCancel = () => _walletCore.clearLockStream();
  }

  void _setupConfigurationStream() {
    _flutterConfig.onListen = () async {
      await _isInitialized.future;
      _walletCore.setConfigurationStream().listen((event) => _flutterConfig.add(event));
    };
    _flutterConfig.onCancel = () => _walletCore.clearConfigurationStream();
  }

  void _setupCardsStream() async {
    //FIXME: Ideally we don't set the card stream until we start observing it (i.e. in onListen())
    //FIXME: but since the cards are not persisted yet that means we might miss events, so observing
    //FIXME: the wallet_core cards stream through the complete lifecycle of the app for now.
    await _isInitialized.future;
    _walletCore.setCardsStream().listen((event) => _cards.add(event));
  }

  void _setupRecentHistoryStream() {
    _recentHistory.onListen = () async {
      await _isInitialized.future;
      _walletCore.setRecentHistoryStream().listen((event) => _recentHistory.add(event));
    };
    _recentHistory.onCancel = () => _walletCore.clearRecentHistoryStream();
  }

  Future<PinValidationResult> isValidPin(String pin) => call((core) => core.isValidPin(pin: pin));

  Future<void> register(String pin) => call((core) => core.register(pin: pin));

  Future<bool> isRegistered() => call((core) => core.hasRegistration());

  Future<void> lockWallet() => call((core) => core.lockWallet());

  Future<WalletInstructionResult> unlockWallet(String pin) => call((core) => core.unlockWallet(pin: pin));

  Stream<bool> get isLocked => _isLocked;

  Stream<FlutterConfiguration> observeConfig() => _flutterConfig.stream;

  Future<String> createPidIssuanceRedirectUri() => call((core) => core.createPidIssuanceRedirectUri());

  Future<IdentifyUriResult> identifyUri(String uri) => call((core) => core.identifyUri(uri: uri));

  Future<void> cancelPidIssuance() => call((core) => core.cancelPidIssuance());

  Future<List<Card>> continuePidIssuance(String uri) => call((core) => core.continuePidIssuance(uri: uri));

  Future<WalletInstructionResult> acceptOfferedPid(String pin) => call((core) => core.acceptPidIssuance(pin: pin));

  Future<void> rejectOfferedPid() => call((core) => core.rejectPidIssuance());

  Future<StartDisclosureResult> startDisclosure(String uri) => call((core) => core.startDisclosure(uri: uri));

  Future<void> cancelDisclosure() => call((core) => core.cancelDisclosure());

  Future<AcceptDisclosureResult> acceptDisclosure(String pin) => call((core) => core.acceptDisclosure(pin: pin));

  Stream<List<Card>> observeCards() => _cards.stream;

  Future<void> resetWallet() => call((core) => core.resetWallet());

  Future<List<WalletEvent>> getHistory() => call((core) => core.getHistory());

  Future<List<WalletEvent>> getHistoryForCard(String docType) =>
      call((core) => core.getHistoryForCard(docType: docType));

  Stream<List<WalletEvent>> observeRecentHistory() => _recentHistory.stream;

  /// This function should be used to call through to the core, as it makes sure potential exceptions are processed
  /// before they are (re)thrown.
  Future<T> call<T>(Future<T> Function(WalletCore) runnable) async {
    try {
      await _isInitialized.future;
      return await runnable(_walletCore);
    } catch (exception, stacktrace) {
      throw _handleCoreException(exception, stackTrace: stacktrace);
    }
  }

  /// Converts the exception to a [CoreError] if it can be mapped into one, otherwise returns the original exception.
  Object _handleCoreException(Object ex, {StackTrace? stackTrace}) {
    try {
      String coreErrorJson = _extractErrorJson(ex)!;
      final error = _errorMapper.map(coreErrorJson);
      if (error is CoreStateError) {
        Fimber.e('StateError detected, this indicates a programming error. Crashing...',
            ex: error, stacktrace: stackTrace);
        exit(0);
      }
      return error;
    } catch (exception) {
      Fimber.e('Failed to map exception to CoreError, returning original exception', ex: exception);
      return ex;
    }
  }

  String? _extractErrorJson(Object ex) {
    if (ex is FrbAnyhowException) {
      Fimber.e('FrbAnyhowException. Contents: ${ex.anyhow}');
      return ex.anyhow;
    } else if (ex is FfiException) {
      Fimber.e('FfiException. Code: ${ex.code}, Message: ${ex.message}');
      if (ex.code != 'RESULT_ERROR') return null;
      return ex.message;
    } else if (ex is String) {
      Fimber.e('StringException. Contents: $ex');
      return ex;
    }
    return null;
  }
}
