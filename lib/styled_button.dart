// Importing the necessary package for material design widgets
import 'package:flutter/material.dart';

// Declaring the path to assets in the package
String packagePath = 'packages/styled_button/assets/';

// Defining the StyledButton class which is a StatelessWidget (UI does not change once built)
class StyledButton extends StatelessWidget {

  // Declaring variables (properties) for the button
  final VoidCallback submit;  // Callback for button press
  final AuthButtonProvider provider;  // The provider (e.g., Google, Facebook, etc.)
  final Color? buttonColor, borderColor, textColor;  // Optional colors for button, border, and text
  final String? text, customLogoPath;  // Optional text for the button and logo image path
  final bool disableIcon;  // Flag to disable the icon
  final bool disableText;  // Flag to disable the text
  final IconSide iconSide;  // Enum to control icon's position (left or right)
  final double? buttonHeight, buttonWidth, borderRadius, borderWidth, iconSize, textSize;  // Optional styling properties
  final TextStyle? textStyle;  // Custom text style
  final FontWeight? fontWeight;  // Font weight for the text
  final Gradient? gradient;  // Optional gradient for the button's background

  // Constructor to initialize the properties
  const StyledButton({
    super.key,  // Key for widget uniqueness (optional)
    required this.submit,  // Button press callback is required
    required this.provider,  // Authentication provider (e.g., Google) is required
    this.buttonHeight,  // Optional height of the button
    this.buttonWidth,  // Optional width of the button
    this.buttonColor,  // Optional color of the button
    this.borderRadius,  // Optional border radius of the button
    this.borderColor,  // Optional color for the button's border
    this.borderWidth,  // Optional border width for the button
    this.text,  // Optional text for the button
    this.disableIcon = false,  // Default value for disabling icon (false = enabled)
    this.disableText = false,  // Default value for disabling text (false = enabled)
    this.iconSide = IconSide.left,  // Default position for the icon (left)
    this.iconSize,  // Optional icon size
    this.textSize,  // Optional text size
    this.customLogoPath,  // Optional path for a custom logo image
    this.textStyle,  // Optional custom text style
    this.textColor,  // Optional color for the text
    this.fontWeight,  // Optional font weight for the text
    this.gradient,  // Optional gradient for button background
  });

  // The build method that returns the widget tree for the StyledButton
  @override
  Widget build(BuildContext context) {
    // Set the logo path based on the customLogoPath or default to an empty string
    String logoPath = customLogoPath ?? '';

    // If no custom logo path is provided, choose the default logo based on the provider
    if (customLogoPath == null) {
      // Switch case based on provider to set the appropriate logo
      switch (provider) {
        case AuthButtonProvider.google:
          logoPath = 'assets/google.png';  // Google logo
          break;
        case AuthButtonProvider.facebook:
          logoPath = 'assets/facebook.png';  // Facebook logo
          break;
        case AuthButtonProvider.twitter:
          logoPath = 'assets/twitter.png';  // Twitter logo
          break;
        case AuthButtonProvider.apple:
          logoPath = 'assets/apple.png';  // Apple logo
          break;
        case AuthButtonProvider.github:
          logoPath = 'assets/github.png';  // GitHub logo
          break;
        case AuthButtonProvider.linkedin:
          logoPath = 'assets/linkedin.png';  // LinkedIn logo
          break;
        case AuthButtonProvider.microsoft:
          logoPath = 'assets/microsoft.png';  // Microsoft logo
          break;
        case AuthButtonProvider.instagram:
          logoPath = 'assets/instagram.png';  // Instagram logo
          break;
        case AuthButtonProvider.discord:
          logoPath = 'assets/discord.png';  // Discord logo
          break;
        case AuthButtonProvider.phone:
          logoPath = 'assets/phone.png';  // Phone logo
          break;
      }
    }

    // Setting the image widget for the icon part of the button
    final imageWidget =
    disableIcon  // If the icon is disabled, show an empty space
        ? const SizedBox.shrink()
        : customLogoPath != null  // If custom logo path is provided, use it
        ? Image.asset(
      customLogoPath!,
      height: (iconSize == 34) ? iconSize : 20.0,  // Set icon size based on provided value or default size
      width: (iconSize == 34) ? iconSize : 20.0,
    )
        : Image.asset(
      logoPath,  // Use the default logo path if custom logo path is not provided
      height: (iconSize == 34) ? iconSize : 20.0,
      width: (iconSize == 34) ? iconSize : 20.0,
      package: 'styled_button',  // Use the logo image from the package assets
    );

    // Setting spacing between icon and text based on whether they are enabled
    final spacing =
    (!disableIcon && !disableText)  // If both icon and text are enabled, add spacing between them
        ? const SizedBox(width: 10.0)
        : const SizedBox.shrink();  // No spacing if either icon or text is disabled

    // Setting the text widget for the button
    final textWidget =
    disableText  // If the text is disabled, show an empty space
        ? const SizedBox.shrink()
        : Flexible(  // Wrap text in a Flexible widget to ensure it fits within available space
      child: Text(
        text ?? '',  // Display the text, defaulting to empty if not provided
        textAlign: TextAlign.center,  // Center-align the text
        overflow: TextOverflow.ellipsis,  // Show ellipsis if text overflows
        style:
        textStyle ??  // Use custom text style or default style
            TextStyle(
              color: textColor ?? Colors.black,  // Text color, default is black
              fontSize: textSize ?? 18.0,  // Text size, default is 18.0
              fontWeight: fontWeight ?? FontWeight.bold,  // Font weight, default is bold
            ),
      ),
    );

    // The entire button wrapped in a GestureDetector for tap detection
    return GestureDetector(
      onTap: submit,  // Trigger the submit callback when the button is tapped
      child: Container(
        height: buttonHeight ?? 60.0,  // Set button height, default is 60.0
        width: buttonWidth ?? double.infinity,  // Set button width, default is full width
        padding: const EdgeInsets.symmetric(horizontal: 10),  // Horizontal padding inside button
        decoration: BoxDecoration(
          color: gradient == null ? (buttonColor ?? Colors.white) : null,  // Set solid color or gradient as background
          gradient: gradient,  // Apply gradient if provided
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),  // Set border radius
          border: Border.all(
            color: borderColor ?? Colors.grey,  // Border color, default is grey
            width: borderWidth ?? 1,  // Border width, default is 1
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,  // Make row size fit the content (icon + text)
          mainAxisAlignment: MainAxisAlignment.center,  // Center the content horizontally
          children:
          iconSide == IconSide.left  // Check if the icon should be on the left or right side
              ? [imageWidget, spacing, textWidget]  // Place icon on left, text on right
              : [textWidget, spacing, imageWidget],  // Place text on left, icon on right
        ),
      ),
    );
  }
}


enum AuthButtonProvider {
  google,  // Google
  facebook,  // Facebook
  twitter,  // Twitter
  apple,  // Apple
  github,  // GitHub
  linkedin,  // LinkedIn
  microsoft,  // Microsoft
  instagram,  // Instagram
  discord,  // Discord
  phone,  // Phone
}



// Enum to define the position of the icon (left or right)
enum IconSide { left, right }

