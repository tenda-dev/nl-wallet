import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/error/network_error.dart';
import '../../../domain/model/pin/pin_validation_error.dart';
import '../../../domain/usecase/pin/check_is_valid_pin_usecase.dart';
import '../../../domain/usecase/pin/unlock_wallet_with_pin_usecase.dart';
import '../../../domain/usecase/wallet/create_wallet_usecase.dart';
import '../../../util/cast_util.dart';
import '../../../util/extension/bloc_extension.dart';
import '../../../util/extension/string_extension.dart';
import '../../../wallet_constants.dart';

part 'setup_security_event.dart';
part 'setup_security_state.dart';

const int _kMaxConfirmAttempts = 1;

class SetupSecurityBloc extends Bloc<SetupSecurityEvent, SetupSecurityState> {
  final UnlockWalletWithPinUseCase unlockWalletWithPinUseCase;
  final CheckIsValidPinUseCase checkIsValidPinUseCase;
  final CreateWalletUseCase createWalletUseCase;

  String _newPin = '';
  String _confirmPin = '';
  int _confirmAttempt = 0;

  SetupSecurityBloc(
    this.checkIsValidPinUseCase,
    this.createWalletUseCase,
    this.unlockWalletWithPinUseCase,
  ) : super(const SetupSecuritySelectPinInProgress(0)) {
    on<SetupSecurityBackPressed>(_onSetupSecurityBackPressedEvent);
    on<PinDigitPressed>(_onPinDigitPressedEvent);
    on<PinBackspacePressed>(_onPinBackspacePressedEvent);
    on<SetupSecurityRetryPressed>(_onRetryPressed);
  }

  Future<void> _onSetupSecurityBackPressedEvent(event, emit) async {
    if (state.canGoBack) {
      if (state is SetupSecurityPinConfirmationInProgress) await _resetFlow(emit);
      if (state is SetupSecurityPinConfirmationFailed) await _resetFlow(emit);
    }
  }

  Future<void> _onPinDigitPressedEvent(event, emit) async {
    final state = this.state;
    if (state is SetupSecuritySelectPinInProgress || state is SetupSecuritySelectPinFailed) {
      await _onSelectPinDigitEvent(event, emit);
    }
    if (state is SetupSecurityPinConfirmationInProgress || state is SetupSecurityPinConfirmationFailed) {
      await _onConfirmPinDigitEvent(event, emit);
    }
  }

  Future<void> _onSelectPinDigitEvent(event, emit) async {
    _newPin += event.digit.toString();
    if (_newPin.length == kPinDigits) {
      try {
        await checkIsValidPinUseCase.invoke(_newPin);
        emit(const SetupSecurityPinConfirmationInProgress(0));
      } catch (error) {
        _newPin = '';
        emit(SetupSecuritySelectPinFailed(reason: tryCast<PinValidationError>(error)));
      }
    } else {
      emit(SetupSecuritySelectPinInProgress(_newPin.length));
    }
  }

  Future<void> _onConfirmPinDigitEvent(event, emit) async {
    _confirmPin += event.digit.toString();
    if (_confirmPin.length != kPinDigits) {
      emit(SetupSecurityPinConfirmationInProgress(_confirmPin.length));
    } else {
      if (_newPin == _confirmPin) {
        emit(SetupSecurityCreatingWallet());
        await _createAndUnlockWallet(_newPin, emit);
      } else {
        _confirmPin = '';
        emit(SetupSecurityPinConfirmationFailed(retryAllowed: _confirmAttempt < _kMaxConfirmAttempts));
        _confirmAttempt++;
      }
    }
  }

  Future<void> _createAndUnlockWallet(String pin, emit) async {
    try {
      await createWalletUseCase.invoke(pin);
      emit(SetupSecurityCompleted());
    } catch (ex, stack) {
      Fimber.e('Failed to create wallet', ex: ex, stacktrace: stack);
      await handleError(
        ex,
        onNetworkError: (ex, hasInternet) => emit(SetupSecurityNetworkError(hasInternet: hasInternet)),
        onUnhandledError: (ex) => emit(SetupSecurityGenericError()),
      );
      _resetFlow(emit);
    }
  }

  Future<void> _onPinBackspacePressedEvent(event, emit) async {
    final state = this.state;
    if (state is SetupSecuritySelectPinInProgress || state is SetupSecuritySelectPinFailed) {
      await _onSelectPinBackspaceEvent(event, emit);
    }
    if (state is SetupSecurityPinConfirmationInProgress || state is SetupSecurityPinConfirmationFailed) {
      await _onConfirmPinBackspaceEvent(event, emit);
    }
  }

  Future<void> _onSelectPinBackspaceEvent(event, emit) async {
    _newPin = _newPin.removeLastChar;
    emit(SetupSecuritySelectPinInProgress(_newPin.length, afterBackspacePressed: true));
  }

  Future<void> _onConfirmPinBackspaceEvent(event, emit) async {
    _confirmPin = _confirmPin.removeLastChar;
    emit(SetupSecurityPinConfirmationInProgress(_confirmPin.length, afterBackspacePressed: true));
  }

  Future<void> _onRetryPressed(event, emit) => _resetFlow(emit);

  Future<void> _resetFlow(emit) async {
    _newPin = '';
    _confirmPin = '';
    _confirmAttempt = 0;
    emit(const SetupSecuritySelectPinInProgress(0, afterBackPressed: true));
  }
}
