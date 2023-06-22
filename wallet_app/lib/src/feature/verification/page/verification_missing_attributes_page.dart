import 'package:flutter/material.dart';

import '../../../util/extension/build_context_extension.dart';
import '../../common/widget/attribute/attribute_row.dart';
import '../../common/widget/button/link_button.dart';
import '../../common/widget/placeholder_screen.dart';
import '../../common/widget/sliver_sized_box.dart';
import '../model/verification_flow.dart';

class VerificationMissingAttributesPage extends StatelessWidget {
  final VerificationFlow flow;
  final VoidCallback onDecline;

  const VerificationMissingAttributesPage({
    required this.flow,
    required this.onDecline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: CustomScrollView(
        restorationId: 'missing_data_attributes_scrollview',
        slivers: <Widget>[
          const SliverSizedBox(height: 32),
          SliverToBoxAdapter(child: _buildHeaderSection(context)),
          const SliverSizedBox(height: 20),
          SliverList(delegate: _getDataAttributesDelegate()),
          const SliverSizedBox(height: 20),
          SliverToBoxAdapter(child: _buildHowToProceedButton(context)),
          const SliverToBoxAdapter(child: Divider(height: 48)),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: _buildCloseRequestButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.verificationMissingAttributesPageTitle,
            style: context.textTheme.displayMedium,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.verificationMissingAttributesPageDescription(flow.organization.name),
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  SliverChildBuilderDelegate _getDataAttributesDelegate() {
    return SliverChildBuilderDelegate(
      (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: AttributeRow(attribute: flow.missingAttributes[index]),
      ),
      childCount: flow.missingAttributes.length,
    );
  }

  Widget _buildHowToProceedButton(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: LinkButton(
        onPressed: () => PlaceholderScreen.show(context),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(context.l10n.verificationMissingAttributesPageHowToProceedCta),
        ),
      ),
    );
  }

  Widget _buildCloseRequestButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          onPressed: onDecline,
          child: Text(context.l10n.verificationMissingAttributesPageCloseCta),
        ),
      ),
    );
  }
}
