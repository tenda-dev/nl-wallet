import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

import '../../domain/model/navigation/navigation_request.dart';
import '../../domain/usecase/deeplink/decode_deeplink_usecase.dart';
import '../../domain/usecase/wallet/is_wallet_initialized_with_pid.dart';
import '../../wallet_routes.dart';

class DeeplinkService {
  final GlobalKey<NavigatorState> _key;
  final DecodeDeeplinkUseCase _decodeDeeplinkUseCase;
  final IsWalletInitializedWithPid _isWalletInitializedWithPid;

  NavigationRequest? _queuedRequest;

  DeeplinkService(this._key, this._decodeDeeplinkUseCase, this._isWalletInitializedWithPid) {
    getInitialUri().then((uri) => _processUri(uri));
    uriLinkStream.listen((uri) => _processUri(uri));
  }

  void _processUri(Uri? uri) {
    if (uri == null) return;
    Fimber.d('Processing uri: $uri');
    final navRequest = _decodeDeeplinkUseCase.invoke(uri);
    if (navRequest != null) _handleNavRequest(navRequest);
  }

  void _handleNavRequest(NavigationRequest request) async {
    if (await _canNavigate()) {
      _navigate(request);
    } else {
      Fimber.d('Not yet ready to handle $request, queued and awaiting call to DeeplinkService.processQueue().');
      _queuedRequest = request;
    }
  }

  Future<bool> _canNavigate() => _isWalletInitializedWithPid.invoke();

  void _navigate(NavigationRequest request) {
    _key.currentState?.restorablePushNamedAndRemoveUntil(
      request.destination,
      ModalRoute.withName(WalletRoutes.homeRoute),
      arguments: request.argument,
    );
  }

  void processQueue() async {
    final queuedRequest = _queuedRequest;
    if (queuedRequest != null && await _canNavigate()) {
      _queuedRequest = null;
      _navigate(queuedRequest);
    }
  }
}