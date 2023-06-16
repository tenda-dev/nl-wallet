// Mocks generated by Mockito 5.4.2 from annotations
// in wallet/test/src/mocks/wallet_mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i9;

import 'package:core_domain/core_domain.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:wallet/src/data/repository/authentication/digid_auth_repository.dart'
    as _i4;
import 'package:wallet/src/data/repository/wallet/wallet_repository.dart'
    as _i6;
import 'package:wallet/src/data/service/app_lifecycle_service.dart' as _i8;
import 'package:wallet/src/domain/model/navigation/navigation_request.dart'
    as _i11;
import 'package:wallet/src/domain/usecase/auth/update_digid_auth_status_usecase.dart'
    as _i12;
import 'package:wallet/src/domain/usecase/deeplink/decode_deeplink_usecase.dart'
    as _i10;
import 'package:wallet/src/domain/usecase/pin/unlock_wallet_with_pin_usecase.dart'
    as _i3;
import 'package:wallet/src/domain/usecase/wallet/is_wallet_initialized_with_pid_usecase.dart'
    as _i13;
import 'package:wallet/src/domain/usecase/wallet/observe_wallet_lock_usecase.dart'
    as _i14;
import 'package:wallet/src/wallet_core/typed_wallet_core.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWalletUnlockResult_0 extends _i1.SmartFake
    implements _i2.WalletUnlockResult {
  _FakeWalletUnlockResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCheckPinResult_1 extends _i1.SmartFake
    implements _i3.CheckPinResult {
  _FakeCheckPinResult_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DigidAuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDigidAuthRepository extends _i1.Mock
    implements _i4.DigidAuthRepository {
  @override
  _i5.Future<String> getAuthUrl() => (super.noSuchMethod(
        Invocation.method(
          #getAuthUrl,
          [],
        ),
        returnValue: _i5.Future<String>.value(''),
        returnValueForMissingStub: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  void notifyDigidStateUpdate(_i2.DigidState? state) => super.noSuchMethod(
        Invocation.method(
          #notifyDigidStateUpdate,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Stream<_i4.DigidAuthStatus> observeAuthStatus() => (super.noSuchMethod(
        Invocation.method(
          #observeAuthStatus,
          [],
        ),
        returnValue: _i5.Stream<_i4.DigidAuthStatus>.empty(),
        returnValueForMissingStub: _i5.Stream<_i4.DigidAuthStatus>.empty(),
      ) as _i5.Stream<_i4.DigidAuthStatus>);
}

/// A class which mocks [WalletRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWalletRepository extends _i1.Mock implements _i6.WalletRepository {
  @override
  _i5.Stream<bool> get isLockedStream => (super.noSuchMethod(
        Invocation.getter(#isLockedStream),
        returnValue: _i5.Stream<bool>.empty(),
        returnValueForMissingStub: _i5.Stream<bool>.empty(),
      ) as _i5.Stream<bool>);
  @override
  _i5.Future<void> validatePin(String? pin) => (super.noSuchMethod(
        Invocation.method(
          #validatePin,
          [pin],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> createWallet(String? pin) => (super.noSuchMethod(
        Invocation.method(
          #createWallet,
          [pin],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<bool> isRegistered() => (super.noSuchMethod(
        Invocation.method(
          #isRegistered,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<void> destroyWallet() => (super.noSuchMethod(
        Invocation.method(
          #destroyWallet,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<_i2.WalletUnlockResult> unlockWallet(String? pin) =>
      (super.noSuchMethod(
        Invocation.method(
          #unlockWallet,
          [pin],
        ),
        returnValue:
            _i5.Future<_i2.WalletUnlockResult>.value(_FakeWalletUnlockResult_0(
          this,
          Invocation.method(
            #unlockWallet,
            [pin],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.WalletUnlockResult>.value(_FakeWalletUnlockResult_0(
          this,
          Invocation.method(
            #unlockWallet,
            [pin],
          ),
        )),
      ) as _i5.Future<_i2.WalletUnlockResult>);
  @override
  void lockWallet() => super.noSuchMethod(
        Invocation.method(
          #lockWallet,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<_i3.CheckPinResult> confirmTransaction(String? pin) =>
      (super.noSuchMethod(
        Invocation.method(
          #confirmTransaction,
          [pin],
        ),
        returnValue: _i5.Future<_i3.CheckPinResult>.value(_FakeCheckPinResult_1(
          this,
          Invocation.method(
            #confirmTransaction,
            [pin],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.CheckPinResult>.value(_FakeCheckPinResult_1(
          this,
          Invocation.method(
            #confirmTransaction,
            [pin],
          ),
        )),
      ) as _i5.Future<_i3.CheckPinResult>);
}

/// A class which mocks [TypedWalletCore].
///
/// See the documentation for Mockito's code generation for more information.
class MockTypedWalletCore extends _i1.Mock implements _i7.TypedWalletCore {
  @override
  _i5.Stream<bool> get isLocked => (super.noSuchMethod(
        Invocation.getter(#isLocked),
        returnValue: _i5.Stream<bool>.empty(),
        returnValueForMissingStub: _i5.Stream<bool>.empty(),
      ) as _i5.Stream<bool>);
  @override
  _i5.Future<_i2.PinValidationResult> isValidPin(String? pin) =>
      (super.noSuchMethod(
        Invocation.method(
          #isValidPin,
          [pin],
        ),
        returnValue: _i5.Future<_i2.PinValidationResult>.value(
            _i2.PinValidationResult.ok),
        returnValueForMissingStub: _i5.Future<_i2.PinValidationResult>.value(
            _i2.PinValidationResult.ok),
      ) as _i5.Future<_i2.PinValidationResult>);
  @override
  _i5.Future<void> register(String? pin) => (super.noSuchMethod(
        Invocation.method(
          #register,
          [pin],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<bool> isRegistered() => (super.noSuchMethod(
        Invocation.method(
          #isRegistered,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<void> lockWallet() => (super.noSuchMethod(
        Invocation.method(
          #lockWallet,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<_i2.WalletUnlockResult> unlockWallet(String? pin) =>
      (super.noSuchMethod(
        Invocation.method(
          #unlockWallet,
          [pin],
        ),
        returnValue:
            _i5.Future<_i2.WalletUnlockResult>.value(_FakeWalletUnlockResult_0(
          this,
          Invocation.method(
            #unlockWallet,
            [pin],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.WalletUnlockResult>.value(_FakeWalletUnlockResult_0(
          this,
          Invocation.method(
            #unlockWallet,
            [pin],
          ),
        )),
      ) as _i5.Future<_i2.WalletUnlockResult>);
  @override
  _i5.Future<String> getDigidAuthUrl() => (super.noSuchMethod(
        Invocation.method(
          #getDigidAuthUrl,
          [],
        ),
        returnValue: _i5.Future<String>.value(''),
        returnValueForMissingStub: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Stream<_i2.UriFlowEvent> processUri(Uri? uri) => (super.noSuchMethod(
        Invocation.method(
          #processUri,
          [uri],
        ),
        returnValue: _i5.Stream<_i2.UriFlowEvent>.empty(),
        returnValueForMissingStub: _i5.Stream<_i2.UriFlowEvent>.empty(),
      ) as _i5.Stream<_i2.UriFlowEvent>);
}

/// A class which mocks [AppLifecycleService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppLifecycleService extends _i1.Mock
    implements _i8.AppLifecycleService {
  @override
  _i5.Stream<_i9.AppLifecycleState> observe() => (super.noSuchMethod(
        Invocation.method(
          #observe,
          [],
        ),
        returnValue: _i5.Stream<_i9.AppLifecycleState>.empty(),
        returnValueForMissingStub: _i5.Stream<_i9.AppLifecycleState>.empty(),
      ) as _i5.Stream<_i9.AppLifecycleState>);
  @override
  void notifyStateChanged(_i9.AppLifecycleState? state) => super.noSuchMethod(
        Invocation.method(
          #notifyStateChanged,
          [state],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DecodeDeeplinkUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockDecodeDeeplinkUseCase extends _i1.Mock
    implements _i10.DecodeDeeplinkUseCase {
  @override
  _i11.NavigationRequest? invoke(Uri? uri) => (super.noSuchMethod(
        Invocation.method(
          #invoke,
          [uri],
        ),
        returnValueForMissingStub: null,
      ) as _i11.NavigationRequest?);
}

/// A class which mocks [UpdateDigidAuthStatusUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateDigidAuthStatusUseCase extends _i1.Mock
    implements _i12.UpdateDigidAuthStatusUseCase {
  @override
  _i5.Future<void> invoke(_i2.DigidState? state) => (super.noSuchMethod(
        Invocation.method(
          #invoke,
          [state],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [IsWalletInitializedWithPidUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockIsWalletInitializedWithPidUseCase extends _i1.Mock
    implements _i13.IsWalletInitializedWithPidUseCase {
  @override
  _i5.Future<bool> invoke() => (super.noSuchMethod(
        Invocation.method(
          #invoke,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [ObserveWalletLockUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockObserveWalletLockUseCase extends _i1.Mock
    implements _i14.ObserveWalletLockUseCase {
  @override
  _i5.Stream<bool> invoke() => (super.noSuchMethod(
        Invocation.method(
          #invoke,
          [],
        ),
        returnValue: _i5.Stream<bool>.empty(),
        returnValueForMissingStub: _i5.Stream<bool>.empty(),
      ) as _i5.Stream<bool>);
}

/// A class which mocks [CheckPinUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockCheckPinUseCase extends _i1.Mock implements _i3.CheckPinUseCase {
  @override
  _i5.Future<_i3.CheckPinResult> invoke(String? pin) => (super.noSuchMethod(
        Invocation.method(
          #invoke,
          [pin],
        ),
        returnValue: _i5.Future<_i3.CheckPinResult>.value(_FakeCheckPinResult_1(
          this,
          Invocation.method(
            #invoke,
            [pin],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.CheckPinResult>.value(_FakeCheckPinResult_1(
          this,
          Invocation.method(
            #invoke,
            [pin],
          ),
        )),
      ) as _i5.Future<_i3.CheckPinResult>);
}
