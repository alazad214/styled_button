# styled_button

A customizable Flutter package for creating beautiful, ready-to-use social login buttons with provider icons.

## 🚀 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  styled_button: <latest_version>
```

Then run:

```bash
flutter pub get
```

### 📂 Add Assets

Make sure to include the assets used by this package:

```yaml
flutter:
  assets:
    - packages/styled_button/assets/
```

## 📦 Import

```dart
import 'package:styled_button/styled_button.dart';
```

## 💡 Usage Example

```dart
StyledButton(
submit: () {
print('Google login pressed');
},
provider: AuthButtonProvider.google,
text: 'Continue with Google',
)
```

## 🛠 Customization Options

You can customize the button with the following parameters:

- `text`: Text to display
- `buttonColor`: Background color of the button
- `textColor`: Color of the text
- `borderColor`: Border color
- `borderRadius`: Roundness of the corners
- `borderWidth`: Thickness of the border
- `iconSide`: Position of the icon (`IconSide.left` or `IconSide.right`)
- `customLogoPath`: Use your own icon if needed
- `iconSize`: Size of the icon
- `textSize`: Font size of the text
- `gradient`: Gradient background
- `textStyle`: Custom `TextStyle`

## 🔌 Supported Providers

```dart
AuthButtonProvider.google
AuthButtonProvider.facebook
AuthButtonProvider.twitter
AuthButtonProvider.apple
AuthButtonProvider.github
AuthButtonProvider.linkedin
AuthButtonProvider.microsoft
AuthButtonProvider.instagram
AuthButtonProvider.discord
AuthButtonProvider.phone
```

## 📂 Example with Custom Icon

```dart
StyledButton(
  submit: () => print('Login with phone'),
  provider: AuthButtonProvider.phone,
  customLogoPath: 'assets/icon/phone.png',
  text: 'Login with Phone',
)
```

