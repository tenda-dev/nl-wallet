import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wallet/src/data/repository/wallet/core/core_wallet_repository.dart';
import 'package:wallet/src/domain/model/pin/pin_validation_error.dart';
import 'package:wallet/src/util/mapper/pin/pin_validation_error_mapper.dart';
import 'package:wallet/src/wallet_core/typed/typed_wallet_core.dart';
import 'package:wallet_core/core.dart';

import '../../../../mocks/core_mock_data.dart';
import '../../../../mocks/wallet_mocks.dart';

const _kValidPin = '112233';

void main() {
  late CoreWalletRepository repo;
  final MockTypedWalletCore core = Mocks.create<TypedWalletCore>() as MockTypedWalletCore;
  late BehaviorSubject<bool> mockLockedStream;

  setUp(() {
    var registered = false;
    mockLockedStream = BehaviorSubject.seeded(true);
    when(core.isLocked).thenAnswer((_) => mockLockedStream);
    when(core.isRegistered()).thenAnswer((_) async => registered);
    when(core.register(any)).thenAnswer((_) async {
      registered = true;
      mockLockedStream.add(false);
    });
    when(core.unlockWallet(any)).thenAnswer((realInvocation) async {
      final pinIsValid = realInvocation.positionalArguments.first == _kValidPin;
      mockLockedStream.add(!pinIsValid);
      if (pinIsValid) return const WalletInstructionResult.ok();
      return const WalletInstructionResult.instructionError(
        error: WalletInstructionError.incorrectPin(
          leftoverAttempts: 3,
          isFinalAttempt: false,
        ),
      );
    });
    when(core.lockWallet()).thenAnswer((realInvocation) async => mockLockedStream.add(true));
    repo = CoreWalletRepository(core, PinValidationErrorMapper()); //FIXME: Mock mapper
  });

  group('locked state', () {
    test('locked defaults to true', () async {
      expect((await repo.isLockedStream.first), true);
    });

    test('locked state is updated when unlocked', () async {
      // Setup to make sure wallet is registered and can be unlocked
      await repo.createWallet(_kValidPin);
      repo.lockWallet();

      expectLater(repo.isLockedStream, emitsInOrder([true, false]));
      await repo.unlockWallet(_kValidPin);
    });

    test('locked state is updated when locked', () async {
      // Setup to make sure wallet is registered and can is unlocked
      await repo.createWallet(_kValidPin);

      expectLater(repo.isLockedStream, emitsInOrder([false, true]));
      repo.lockWallet();
    });

    test('locked state is not updated when incorrect pin is provided', () async {
      expectLater(repo.isLockedStream, emitsInOrder([true]));
      await repo.createWallet('invalid');
    });

    test('unlocking is not possible when not registered', () async {
      expect(() => repo.unlockWallet(_kValidPin), throwsUnsupportedError);
    });
  });

  group('registered state', () {
    test('registered state defaults to false', () async {
      final registered = await repo.isRegistered();
      expect(registered, false);
    });
    test('registered is true after wallet creation', () async {
      await repo.createWallet(_kValidPin);

      final registered = await repo.isRegistered();
      expect(registered, true);
    });
  });

  group('wallet creation', () {
    test('wallet is unlocked after registration', () async {
      expectLater(repo.isLockedStream, emitsInOrder([true, false]));
      repo.createWallet(_kValidPin);
    });
  });

  group('pin validation', () {
    test('checking invalid pin results in a thrown PinValidationError', () async {
      when(core.isValidPin(any)).thenAnswer((realInvocation) async => PinValidationResult.TooFewUniqueDigits);
      expect(() async => repo.validatePin('000000'), throwsA(isA<PinValidationError>()));
    });

    test('checking a valid pin completes without throwing', () async {
      when(core.isValidPin(any)).thenAnswer((realInvocation) async => PinValidationResult.Ok);
      expect(repo.validatePin('112233'), completes);
    });
  });

  group('reset wallet', () {
    test('wallet reset is passed on to core', () async {
      await repo.resetWallet();
      verify(core.resetWallet()).called(1);
    });
  });

  group('leftover attempts', () {
    test('result exposes correct amount of leftover pin attempts', () async {
      await repo.createWallet(_kValidPin);
      repo.lockWallet();

      when(core.unlockWallet(any)).thenAnswer(
        (_) async => const WalletInstructionResult.instructionError(
          error: WalletInstructionError.incorrectPin(
            leftoverAttempts: 1337,
            isFinalAttempt: false,
          ),
        ),
      );

      const expected = WalletInstructionResult.instructionError(
        error: WalletInstructionError.incorrectPin(
          leftoverAttempts: 1337,
          isFinalAttempt: false,
        ),
      );
      final result = await repo.unlockWallet('invalid');
      expect(result, expected);
    });

    test('when locking fails, the app exits', () async {
      await repo.createWallet(_kValidPin);
      when(core.lockWallet()).thenAnswer((realInvocation) async => throw 'failed to lock');
      var exitCodeUsed = -1;
      repo.exit = (code) => exitCodeUsed = code;
      await repo.lockWallet();
      expect(exitCodeUsed, 1);
    });
  });

  group('contains pid', () {
    test('when wallet contains pid the method returns true', () async {
      const cardWithPidDocType = Card(
        persistence: CardPersistence.stored(id: '0'),
        docType: kPidDocType,
        attributes: [],
        issuer: CoreMockData.organization,
      );
      when(core.observeCards()).thenAnswer((_) => Stream.value([cardWithPidDocType]));
      final result = await repo.containsPid();
      expect(result, isTrue);
    });

    test('when wallet does not contain pid the method returns false', () async {
      when(core.observeCards()).thenAnswer((_) => Stream.value([]));
      final result = await repo.containsPid();
      expect(result, isFalse);
    });
  });

  group('unimplemented', () {
    // This group makes sure that, once features are implemented, we are reminded to update the tests.
    test('confirmTransaction', () async {
      expect(() => repo.confirmTransaction(_kValidPin), throwsUnimplementedError);
    });
  });
}
