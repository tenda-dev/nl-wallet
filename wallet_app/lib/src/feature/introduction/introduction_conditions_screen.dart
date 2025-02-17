import 'package:flutter/material.dart';

import '../../navigation/wallet_routes.dart';
import '../../util/extension/build_context_extension.dart';
import '../../wallet_assets.dart';
import '../common/screen/placeholder_screen.dart';
import '../common/widget/bullet_list.dart';
import '../common/widget/button/primary_button.dart';
import '../common/widget/button/secondary_button.dart';
import '../common/widget/button/wallet_app_bar_back_button.dart';
import '../common/widget/sliver_wallet_app_bar.dart';

class IntroductionConditionsScreen extends StatelessWidget {
  const IntroductionConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('introductionConditionsScreen'),
      body: SafeArea(child: _buildContent(context)),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: CustomScrollView(
        slivers: [
          SliverWalletAppBar(
            title: context.l10n.introductionConditionsScreenHeadline,
            progress: 0.16,
            leading: const WalletAppBarBackButton(),
            actions: [
              IconButton(
                onPressed: () => Navigator.pushNamed(context, WalletRoutes.aboutRoute),
                icon: const Icon(Icons.help_outline_rounded),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: MergeSemantics(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BulletList(
                      items: context.l10n.introductionConditionsScreenBulletPoints.split('\n'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Image.asset(
                WalletAssets.illustration_conditions_screen,
                fit: context.isLandscape ? BoxFit.contain : BoxFit.fitWidth,
                height: context.isLandscape ? 160 : null,
                width: double.infinity,
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: _buildBottomSection(context),
          )
        ],
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Divider(height: 1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: context.isLandscape ? 8 : 24),
          child: Column(
            children: [
              SecondaryButton(
                key: const Key('introductionConditionsScreenConditionsCta'),
                onPressed: () => PlaceholderScreen.show(context, secured: false),
                text: context.l10n.introductionConditionsScreenConditionsCta,
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                key: const Key('introductionConditionsScreenNextCta'),
                onPressed: () => Navigator.of(context).restorablePushNamedAndRemoveUntil(
                  WalletRoutes.setupSecurityRoute,
                  ModalRoute.withName(WalletRoutes.splashRoute),
                ),
                text: context.l10n.introductionConditionsScreenNextCta,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
