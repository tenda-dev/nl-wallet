import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wallet/src/data/repository/card/wallet_card_repository.dart';
import 'package:wallet/src/data/repository/configuration/configuration_repository.dart';
import 'package:wallet/src/data/repository/history/timeline_attribute_repository.dart';
import 'package:wallet/src/data/repository/pid/pid_repository.dart';
import 'package:wallet/src/data/repository/wallet/wallet_repository.dart';
import 'package:wallet/src/data/service/app_lifecycle_service.dart';
import 'package:wallet/src/data/service/navigation_service.dart';
import 'package:wallet/src/domain/usecase/app/check_is_app_initialized_usecase.dart';
import 'package:wallet/src/domain/usecase/card/observe_wallet_cards_usecase.dart';
import 'package:wallet/src/domain/usecase/disclosure/accept_disclosure_usecase.dart';
import 'package:wallet/src/domain/usecase/disclosure/cancel_disclosure_usecase.dart';
import 'package:wallet/src/domain/usecase/disclosure/start_disclosure_usecase.dart';
import 'package:wallet/src/domain/usecase/history/get_wallet_timeline_attributes_usecase.dart';
import 'package:wallet/src/domain/usecase/history/observe_recent_history_usecase.dart';
import 'package:wallet/src/domain/usecase/issuance/accept_issuance_usecase.dart';
import 'package:wallet/src/domain/usecase/navigation/check_navigation_prerequisites_usecase.dart';
import 'package:wallet/src/domain/usecase/navigation/perform_pre_navigation_actions_usecase.dart';
import 'package:wallet/src/domain/usecase/network/check_has_internet_usecase.dart';
import 'package:wallet/src/domain/usecase/pid/accept_offered_pid_usecase.dart';
import 'package:wallet/src/domain/usecase/pin/check_pin_usecase.dart';
import 'package:wallet/src/domain/usecase/sign/accept_sign_agreement_usecase.dart';
import 'package:wallet/src/domain/usecase/uri/decode_uri_usecase.dart';
import 'package:wallet/src/domain/usecase/wallet/is_wallet_initialized_with_pid_usecase.dart';
import 'package:wallet/src/domain/usecase/wallet/observe_wallet_locked_usecase.dart';
import 'package:wallet/src/domain/usecase/wallet/setup_mocked_wallet_usecase.dart';
import 'package:wallet/src/util/extension/bloc_extension.dart';
import 'package:wallet/src/util/mapper/mapper.dart';
import 'package:wallet/src/wallet_core/typed/typed_wallet_core.dart';
import 'package:wallet_core/core.dart';

import 'wallet_mocks.mocks.dart';

export 'wallet_mocks.mocks.dart';

/// Mock framework
@GenerateNiceMocks([MockSpec<NavigatorState>()])

/// Mock mappers
@GenerateNiceMocks([MockSpec<Mapper>()])

/// Mock repositories
@GenerateNiceMocks([MockSpec<PidRepository>()])
@GenerateNiceMocks([MockSpec<WalletRepository>()])
@GenerateNiceMocks([MockSpec<WalletCardRepository>()])
@GenerateNiceMocks([MockSpec<TimelineAttributeRepository>()])
@GenerateNiceMocks([MockSpec<ConfigurationRepository>()])

/// Mock services
@GenerateNiceMocks([MockSpec<TypedWalletCore>()])
@GenerateNiceMocks([MockSpec<NavigationService>()])

/// Mock use cases
@GenerateNiceMocks([MockSpec<DecodeUriUseCase>()])
@GenerateNiceMocks([MockSpec<IsWalletInitializedUseCase>()])
@GenerateNiceMocks([MockSpec<IsWalletInitializedWithPidUseCase>()])
@GenerateNiceMocks([MockSpec<ObserveWalletLockedUseCase>()])
@GenerateNiceMocks([MockSpec<CheckPinUseCase>()])
@GenerateNiceMocks([MockSpec<SetupMockedWalletUseCase>()])
@GenerateNiceMocks([MockSpec<CheckHasInternetUseCase>()])
@GenerateNiceMocks([MockSpec<PerformPreNavigationActionsUseCase>()])
@GenerateNiceMocks([MockSpec<CheckNavigationPrerequisitesUseCase>()])
@GenerateNiceMocks([MockSpec<AcceptOfferedPidUseCase>()])
@GenerateNiceMocks([MockSpec<AcceptSignAgreementUseCase>()])
@GenerateNiceMocks([MockSpec<AcceptDisclosureUseCase>()])
@GenerateNiceMocks([MockSpec<AcceptIssuanceUseCase>()])
@GenerateNiceMocks([MockSpec<StartDisclosureUseCase>()])
@GenerateNiceMocks([MockSpec<CancelDisclosureUseCase>()])
@GenerateNiceMocks([MockSpec<GetWalletTimelineAttributesUseCase>()])
@GenerateNiceMocks([MockSpec<ObserveWalletCardsUseCase>()])
@GenerateNiceMocks([MockSpec<ObserveRecentHistoryUseCase>()])

/// Core
@GenerateNiceMocks([MockSpec<WalletCore>()])

/// Constants
const kMockPidIssuanceUrl = 'https://example.org';

/// Class that provides the generated mocks with very
/// basic, or no stubbing. Stubs can be overwritten or the mocks
/// can always be instantiated directly. The main intention here is
/// to allow us to instantiate classes under tests in a simple way,
/// i.e. `xxRepository(Mocks.create(), Mocks.create(), Mocks.create())`
/// When you need more control over what a mock returns you should
/// probably instantiate the mock directly in your test class.
class Mocks {
  Mocks._();

  static final sl = GetIt.asNewInstance();
  static var isInitialized = false;

  static void initialize() {
    // Core
    sl.registerFactory<WalletCore>(() => MockWalletCore());

    // Services
    sl.registerFactory<AppLifecycleService>(() => AppLifecycleService());
    sl.registerFactory<TypedWalletCore>(() => getTypedWalletCoreMock());

    // Use cases
    sl.registerFactory<DecodeUriUseCase>(() => MockDecodeUriUseCase());
    sl.registerFactory<IsWalletInitializedWithPidUseCase>(() => MockIsWalletInitializedWithPidUseCase());
    sl.registerFactory<ObserveWalletLockedUseCase>(() => MockObserveWalletLockedUseCase());
    sl.registerFactory<CheckPinUseCase>(() => MockCheckPinUseCase());
    sl.registerFactory<SetupMockedWalletUseCase>(() => MockSetupMockedWalletUseCase());
    sl.registerFactory<CheckHasInternetUseCase>(() {
      final mock = MockCheckHasInternetUseCase();
      when(mock.invoke()).thenAnswer((realInvocation) async => true);
      BlocExtensions.checkHasInternetUseCase = mock;
      return mock;
    });
    sl.registerFactory<AcceptOfferedPidUseCase>(() => MockAcceptOfferedPidUseCase());
    sl.registerFactory<StartDisclosureUseCase>(() => MockStartDisclosureUseCase());
    sl.registerFactory<CancelDisclosureUseCase>(() => MockCancelDisclosureUseCase());

    // Repositories
    sl.registerFactory<PidRepository>(() => getMockPidRepository());
    sl.registerFactory<WalletRepository>(() => MockWalletRepository());

    // Mappers
    sl.registerFactory<Mapper>(() => MockMapper());

    isInitialized = true;
  }

  static MockTypedWalletCore getTypedWalletCoreMock() {
    final mock = MockTypedWalletCore();
    when(mock.createPidIssuanceRedirectUri()).thenAnswer((_) async => kMockPidIssuanceUrl);
    return mock;
  }

  static MockPidRepository getMockPidRepository() {
    final mock = MockPidRepository();
    when(mock.getPidIssuanceUrl()).thenAnswer((_) async => kMockPidIssuanceUrl);
    return mock;
  }

  static T create<T extends Object>() {
    if (!isInitialized) initialize();
    return sl.get<T>();
  }
}
