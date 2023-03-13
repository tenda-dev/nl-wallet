part of 'wallet_personalize_bloc.dart';

abstract class WalletPersonalizeEvent extends Equatable {
  const WalletPersonalizeEvent();

  @override
  List<Object?> get props => [];
}

class WalletPersonalizeLoginWithDigidClicked extends WalletPersonalizeEvent {}

class WalletPersonalizeLoginWithDigidSucceeded extends WalletPersonalizeEvent {}

class WalletPersonalizeLoginWithDigidFailed extends WalletPersonalizeEvent {}

class WalletPersonalizeOfferingVerified extends WalletPersonalizeEvent {}

class WalletPersonalizeOnRetryClicked extends WalletPersonalizeEvent {}

class WalletPersonalizeOnBackPressed extends WalletPersonalizeEvent {}

class WalletPersonalizePinConfirmed extends WalletPersonalizeEvent {}

class WalletPersonalizeSelectedCardToggled extends WalletPersonalizeEvent {
  final WalletCard card;

  const WalletPersonalizeSelectedCardToggled(this.card);
}
