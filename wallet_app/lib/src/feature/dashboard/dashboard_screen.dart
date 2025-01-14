import 'dart:math';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../domain/model/wallet_card.dart';
import '../../navigation/secured_page_route.dart';
import '../../navigation/wallet_routes.dart';
import '../../util/extension/build_context_extension.dart';
import '../../wallet_assets.dart';
import '../card/detail/argument/card_detail_screen_argument.dart';
import '../card/detail/card_detail_screen.dart';
import '../common/screen/placeholder_screen.dart';
import '../common/widget/activity_summary.dart';
import '../common/widget/card/wallet_card_item.dart';
import '../common/widget/centered_loading_indicator.dart';
import '../common/widget/fade_in_at_offset.dart';
import '../common/widget/sliver_sized_box.dart';
import '../common/widget/text_with_link.dart';
import '../common/widget/wallet_app_bar.dart';
import 'argument/dashboard_screen_argument.dart';
import 'bloc/dashboard_bloc.dart';

/// Defines the width required to render a card,
/// used to calculate the crossAxisCount.
const _kCardBreakPointWidth = 300.0;

class DashboardScreen extends StatelessWidget {
  static DashboardScreenArgument? getArgument(RouteSettings settings) {
    final args = settings.arguments;
    if (args == null) return null;
    try {
      return DashboardScreenArgument.fromJson(args as Map<String, dynamic>);
    } catch (exception, stacktrace) {
      Fimber.e('Failed to decode $args', ex: exception, stacktrace: stacktrace);
      return null;
    }
  }

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('dashboardScreen'),
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return WalletAppBar(
      leading: IconButton(
        onPressed: () => Navigator.pushNamed(context, WalletRoutes.menuRoute),
        icon: const Icon(Icons.menu),
        tooltip: context.l10n.dashboardScreenTitle,
      ),
      title: ExcludeSemantics(
        excluding: true /* Excluding as the IconButton above is already read out, including the 'menu' tooltip */,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, WalletRoutes.menuRoute),
          child: Text(
            context.l10n.dashboardScreenTitle,
            style: context.textTheme.titleMedium!.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      actions: [
        FadeInAtOffset(
            visibleOffset: 150,
            appearOffset: 100,
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, WalletRoutes.qrRoute),
              icon: const Icon(Icons.qr_code_rounded),
            )),
        IconButton(
          onPressed: () => PlaceholderScreen.show(context),
          icon: const Icon(Icons.help_outline_rounded),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return switch (state) {
            DashboardStateInitial() => _buildLoading(),
            DashboardLoadInProgress() => _buildLoading(),
            DashboardLoadSuccess() => _buildContent(context, state),
            DashboardLoadFailure() => _buildError(context),
          };
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const CenteredLoadingIndicator();
  }

  Widget _buildContent(BuildContext context, DashboardLoadSuccess state) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 250,
            alignment: Alignment.center,
            child: _buildQrLogo(context),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: SliverToBoxAdapter(
            child: ActivitySummary(
              attributes: state.history ?? [],
              onTap: () => Navigator.pushNamed(context, WalletRoutes.walletHistoryRoute),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: _buildCardsSliver(context, state.cards),
        ),
        SliverToBoxAdapter(
          child: _buildFooter(context),
        ),
        SliverSizedBox(
          height: context.mediaQuery.padding.bottom,
        )
      ],
    );
  }

  Widget _buildCardsSliver(BuildContext context, List<WalletCard> cards) {
    final crossAxisCount = max(1, (context.mediaQuery.size.width / _kCardBreakPointWidth).floor());
    return SliverMasonryGrid(
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      delegate: SliverChildBuilderDelegate(
        (context, index) => _buildCardListItem(context, cards[index]),
        childCount: cards.length,
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final cta = context.l10n.dashboardScreenFooterCta;
    final fullString = context.l10n.dashboardScreenFooter(cta);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: TextWithLink(
        ctaText: cta,
        fullText: fullString,
        textAlign: TextAlign.center,
        onCtaPressed: () => Navigator.pushNamed(context, WalletRoutes.aboutRoute),
        style: context.textTheme.bodyMedium,
      ),
    );
  }

  Widget _buildQrLogo(BuildContext context) {
    onTapQr() => Navigator.pushNamed(context, WalletRoutes.qrRoute);
    return GestureDetector(
      onTap: onTapQr,
      child: MergeSemantics(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(WalletAssets.svg_qr_button),
            TextButton(
              onPressed: onTapQr,
              child: Text(context.l10n.dashboardScreenQrCta),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCardListItem(BuildContext context, WalletCard walletCard) {
    return Hero(
      tag: walletCard.id,
      child: WalletCardItem.fromCardFront(
        context: context,
        key: Key(walletCard.docType),
        front: walletCard.front,
        onPressed: () => _onCardPressed(context, walletCard),
      ),
    );
  }

  void _onCardPressed(BuildContext context, WalletCard walletCard) {
    SecuredPageRoute.overrideDurationOfNextTransition(kPreferredCardDetailEntryTransitionDuration);
    Navigator.restorablePushNamed(
      context,
      WalletRoutes.cardDetailRoute,
      arguments: CardDetailScreenArgument.forCard(walletCard).toJson(),
    );
  }

  Widget _buildError(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            context.l10n.errorScreenGenericDescription,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => context.read<DashboardBloc>().add(const DashboardLoadTriggered()),
            child: Text(context.l10n.generalRetry),
          ),
        ],
      ),
    );
  }

  /// Show the [DashboardScreen], placing it at the root of the navigation stack. When [cards] are provided
  /// the [DashboardBloc] is initialized with these cards, so that they are instantly
  /// available, e.g. useful when triggering Hero animations.
  static void show(BuildContext context, {List<WalletCard>? cards}) {
    if (cards != null) SecuredPageRoute.overrideDurationOfNextTransition(const Duration(milliseconds: 800));
    Navigator.restorablePushNamedAndRemoveUntil(
      context,
      WalletRoutes.dashboardRoute,
      ModalRoute.withName(WalletRoutes.splashRoute),
      arguments: cards == null ? null : DashboardScreenArgument(cards: cards).toJson(),
    );
  }
}
