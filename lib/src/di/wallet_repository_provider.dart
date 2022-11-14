import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository/card/mock_timeline_attribute_repository.dart';
import '../data/repository/card/mock_wallet_card_data_highlight_repository.dart';
import '../data/repository/card/timeline_attribute_repository.dart';
import '../data/repository/card/wallet_card_data_attribute_repository.dart';
import '../data/repository/card/wallet_card_data_attribute_repository_impl.dart';
import '../data/repository/card/wallet_card_data_highlight_repository.dart';
import '../data/repository/card/wallet_card_repository.dart';
import '../data/repository/card/wallet_card_repository_impl.dart';
import '../data/repository/issuer/issue_response_repository.dart';
import '../data/repository/issuer/mock_issue_response_repository.dart';
import '../data/repository/qr/mock_qr_repository.dart';
import '../data/repository/qr/qr_repository.dart';
import '../data/repository/verification/mock_verification_request_repository.dart';
import '../data/repository/verification/verification_request_repository.dart';
import '../data/repository/wallet/mock_wallet_repository.dart';
import '../data/repository/wallet/wallet_repository.dart';

/// This widget is responsible for initializing and providing all `repositories`.
/// Most likely to be used once at the top (app) level.
class WalletRepositoryProvider extends StatelessWidget {
  final Widget child;

  const WalletRepositoryProvider({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WalletRepository>(
          create: (context) => MockWalletRepository(),
        ),
        RepositoryProvider<WalletCardRepository>(
          create: (context) => WalletCardRepositoryImpl(context.read()),
        ),
        RepositoryProvider<WalletCardDataAttributeRepository>(
          create: (context) => WalletCardDataAttributeRepositoryImpl(context.read()),
        ),
        RepositoryProvider<WalletCardDataHighlightRepository>(
          create: (context) => MockWalletCardDataHighlightRepository(),
        ),
        RepositoryProvider<TimelineAttributeRepository>(
          create: (context) => MockTimelineAttributeRepository(),
        ),
        RepositoryProvider<VerificationRequestRepository>(
          create: (context) => MockVerificationRequestRepository(context.read()),
        ),
        RepositoryProvider<QrRepository>(
          create: (context) => MockQrRepository(),
        ),
        RepositoryProvider<IssueResponseRepository>(
          create: (context) => MockIssueResponseRepository(context.read(), context.read()),
        ),
      ],
      child: child,
    );
  }
}
