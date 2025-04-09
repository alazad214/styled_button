import 'package:flutter/material.dart';

String packagePath = 'packages/styled_button/assets/';

class StyledButton extends StatelessWidget {
  final VoidCallback submit;
  final AuthButtonProvider provider;
  final Color? buttonColor, borderColor, textColor;
  final String? text, customLogoPath;
  final bool disableIcon;
  final bool disableText;
  final IconSide iconSide;
  final double? buttonHeight,
      buttonWidth,
      borderRadius,
      borderWidth,
      iconSize,
      textSize;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;
  final Gradient? gradient;

  const StyledButton({
    super.key,
    required this.submit,
    required this.provider,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonColor,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.text,
    this.disableIcon = false,
    this.disableText = false,
    this.iconSide = IconSide.left,
    this.iconSize,
    this.textSize,
    this.customLogoPath,
    this.textStyle,
    this.textColor,
    this.fontWeight,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    String logoPath = customLogoPath ?? '';

    if (customLogoPath == null) {
      switch (provider) {
        case AuthButtonProvider.google:
          logoPath = 'assets/google.png';
          break;
        case AuthButtonProvider.facebook:
          logoPath = 'assets/facebook.png';
          break;
        case AuthButtonProvider.twitter:
          logoPath = 'assets/twitter.png';
          break;
        case AuthButtonProvider.apple:
          logoPath = 'assets/apple.png';
          break;
        case AuthButtonProvider.github:
          logoPath = 'assets/github.png';
          break;
        case AuthButtonProvider.linkedin:
          logoPath = 'assets/linkedin.png';
          break;
        case AuthButtonProvider.microsoft:
          logoPath = 'assets/microsoft.png';
          break;
        case AuthButtonProvider.instagram:
          logoPath = 'assets/instagram.png';
          break;
        case AuthButtonProvider.discord:
          logoPath = 'assets/discord.png';
          break;
        case AuthButtonProvider.phone:
          logoPath = 'assets/phone.png';
          break;
      }
    }

    final imageWidget =
        disableIcon
            ? const SizedBox.shrink()
            : customLogoPath != null
            ? Image.asset(
              customLogoPath!,
              height: (iconSize == 34) ? iconSize : 20.0,
              width: (iconSize == 34) ? iconSize : 20.0,
            )
            : Image.asset(
              logoPath,
              height: (iconSize == 34) ? iconSize : 20.0,
              width: (iconSize == 34) ? iconSize : 20.0,
              package: 'styled_button',
            );

    final spacing =
        (!disableIcon && !disableText)
            ? const SizedBox(width: 10.0)
            : const SizedBox.shrink();

    final textWidget =
        disableText
            ? const SizedBox.shrink()
            : Flexible(
              child: Text(
                text ?? '',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style:
                    textStyle ??
                    TextStyle(
                      color: textColor ?? Colors.black,
                      fontSize: textSize ?? 18.0,
                      fontWeight: fontWeight ?? FontWeight.bold,
                    ),
              ),
            );

    return GestureDetector(
      onTap: submit,
      child: Container(
        height: buttonHeight ?? 60.0,
        width: buttonWidth ?? double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: gradient == null ? (buttonColor ?? Colors.white) : null,
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          border: Border.all(
            color: borderColor ?? Colors.grey,
            width: borderWidth ?? 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              iconSide == IconSide.left
                  ? [imageWidget, spacing, textWidget]
                  : [textWidget, spacing, imageWidget],
        ),
      ),
    );
  }
}

enum AuthButtonProvider {
  google,
  facebook,
  twitter,
  apple,
  github,
  linkedin,
  microsoft,
  instagram,
  discord,
  phone,
}

enum IconSide { left, right }
