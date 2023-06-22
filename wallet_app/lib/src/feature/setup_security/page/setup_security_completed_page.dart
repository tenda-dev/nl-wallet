import 'package:flutter/material.dart';

import '../../../util/extension/build_context_extension.dart';
import '../../common/widget/flow_terminal_page.dart';

class SetupSecurityCompletedPage extends StatelessWidget {
  final VoidCallback onSetupWalletPressed;

  const SetupSecurityCompletedPage({required this.onSetupWalletPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowTerminalPage(
      icon: Icons.check,
      title: context.l10n.setupSecurityCompletedPageTitle,
      closeButtonCta: context.l10n.setupSecurityCompletedPageCreateWalletCta,
      description: context.l10n.setupSecurityCompletedPageDescription,
      onClosePressed: onSetupWalletPressed,
    );
  }
}
