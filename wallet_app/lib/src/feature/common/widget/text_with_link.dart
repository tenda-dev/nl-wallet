import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../util/extension/build_context_extension.dart';

class TextWithLink extends StatelessWidget {
  final String fullText;
  final String ctaText;
  final TextStyle? style;
  final TextAlign textAlign;
  final VoidCallback? onCtaPressed;

  TextWithLink({
    required this.fullText,
    required this.ctaText,
    this.style,
    this.textAlign = TextAlign.start,
    this.onCtaPressed,
    super.key,
  })  : assert(fullText.contains(ctaText), 'ctaText should be part of the full text'),
        assert(
            kDebugMode && fullText.split(ctaText).length == 2,
            'Currently only text formatted as "View {cta} for more info"'
            'is supported (i.e. where ctaText is enclosed in the fullText)');

  @override
  Widget build(BuildContext context) {
    final parts = fullText.split(ctaText);

    /// Fallback for production, so we don't crash for an ill formatted text.
    if (parts.length != 2) return Text(fullText, style: style ?? context.textTheme.bodyLarge);
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        style: style ?? context.textTheme.bodyLarge,
        children: [
          TextSpan(text: parts.first),
          TextSpan(
            text: ctaText,
            style: TextStyle(
              color: context.colorScheme.primary,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onCtaPressed,
          ),
          TextSpan(text: parts.last),
        ],
      ),
    );
  }
}
