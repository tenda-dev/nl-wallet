import 'package:flutter/material.dart';

import 'button/link_button.dart';
import 'button/text_icon_button.dart';
import 'status_icon.dart';

/// Base widget for the terminal (ending) page of the issuance/verification flow.
class FlowTerminalPage extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final String description;
  final String? secondaryButtonCta;
  final VoidCallback? onSecondaryButtonPressed;
  final String? tertiaryButtonCta;
  final VoidCallback? onTertiaryButtonPressed;
  final String closeButtonCta;
  final VoidCallback onClosePressed;
  final Widget? content;

  const FlowTerminalPage({
    required this.icon,
    this.iconColor,
    required this.title,
    required this.description,
    this.secondaryButtonCta,
    this.onSecondaryButtonPressed,
    this.tertiaryButtonCta,
    this.onTertiaryButtonPressed,
    this.content,
    required this.closeButtonCta,
    required this.onClosePressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildScrollableSection(context),
        const SizedBox(height: 16),
        _buildBottomSection(context),
      ],
    );
  }

  Widget _buildScrollableSection(BuildContext context) {
    return Expanded(
      child: ListView(
        primary: false /* Avoid PrimaryScrollController clash */,
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: StatusIcon(
                icon: icon,
                color: iconColor,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.start,
            ),
          ),
          if (tertiaryButtonCta != null)
            LinkButton(
              customPadding: const EdgeInsets.symmetric(horizontal: 16),
              onPressed: onTertiaryButtonPressed,
              child: Text(tertiaryButtonCta!),
            ),
          if (content != null) content!,
        ],
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    Widget? secondaryButton;
    if (secondaryButtonCta != null) {
      secondaryButton = TextIconButton(
        onPressed: onSecondaryButtonPressed,
        child: Text(secondaryButtonCta!),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (secondaryButton != null) secondaryButton,
        if (secondaryButton != null) const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: onClosePressed,
            child: Text(closeButtonCta),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
