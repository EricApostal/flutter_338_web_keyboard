# Flutter 3.38.* Web Android Keyboard Issue
When using Flutter 3.38.* on Android Web, pressing the down arrow on the keyboard will not remove the spacing provided by the keyboard.

## Instructions to reproduce
- Clone this repo
- Ensure you are on the latest stable version of Flutter
- Use `flutter run -d web-server`
- Navigate to your device's IP from your Android phone in Chrome / Firefox / etc
- Tap the text field
- Click the down arrow on your system's keyboard
- Observe the underlying `index.html` taking up that space

For the issue: https://github.com/flutter/flutter/issues/175074

https://github.com/user-attachments/assets/7d6db193-21eb-4313-b948-28cdde11f5e2
