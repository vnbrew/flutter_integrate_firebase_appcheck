# English Brain Hacking Application
```sh
flutter doctor
[✓] Flutter (Channel stable, 3.7.1, on macOS 13.0.1 22A400 darwin-arm64, locale en-US)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.1)
[✓] Xcode - develop for iOS and macOS (Xcode 14.2)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2021.3)
[✓] VS Code (version 1.75.0)
[✓] Connected device (3 available)
[✓] HTTP Host Availability

dart --version
Dart SDK version: 2.19.1 (stable) (Tue Jan 31 12:25:35 2023 +0000) on "macos_arm64"
```
## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart

# Build runner
$ flutter pub run build_runner build -d

# Build localization
$ flutter pub global run intl_utils:generate
```