# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Elite Academy is a Flutter application for educational institution management. It supports multiple platforms (iOS, Android, macOS, Windows, web) and includes features for students, faculty, and admin users.

## Tech Stack

- **Framework**: Flutter (Dart)
- **State Management**: Riverpod 2.x
- **Navigation**: AutoRoute
- **Backend**: Firebase (Auth, Firestore, Storage, App Check)
- **Local Storage**: Hive
- **Dependency Injection**: Riverpod
- **UI/Theming**: FlexColorScheme, custom themes
- **Internationalization**: Flutter i18n with ARB files

## Essential Commands

### Development
- `fvm flutter run` - Run the app in debug mode
- `fvm flutter run --flavor development -t lib/main_development.dart` - Run development flavor
- `fvm flutter run --flavor staging -t lib/main_staging.dart` - Run staging flavor
- `fvm flutter run --flavor production -t lib/main_production.dart` - Run production flavor

### Build
- `fvm flutter build apk` - Build APK for Android
- `fvm flutter build ios` - Build for iOS
- `fvm flutter build web` - Build for web
- `fvm flutter build macos` - Build for macOS
- `fvm flutter build windows` - Build for Windows

### Testing
- `fvm flutter test` - Run all tests
- `fvm flutter test test/path/to/test.dart` - Run specific test file

### Code Generation
- `fvm flutter pub run build_runner build --delete-conflicting-outputs` - Generate code (AutoRoute, Hive adapters, JSON serialization)
- `fvm flutter pub run build_runner watch --delete-conflicting-outputs` - Watch mode for code generation

### Linting & Analysis
- `fvm flutter analyze` - Run static analysis
- `fvm dart run custom_lint` - Run custom lint rules

### Icons Generation
- `fvm flutter pub run flutter_launcher_icons` - Generate app icons from configuration

### Dependencies
- `fvm flutter pub get` - Install dependencies
- `fvm flutter pub upgrade` - Upgrade dependencies

## High-Level Architecture

### Directory Structure
```
lib/
├── app/                  # Application setup and configuration
│   └── view/            # Main app widget with theming, routing, locale
├── core/                # Core functionality
│   ├── local_storage/   # Hive storage abstraction
│   ├── router/          # AutoRoute configuration and generated routes
│   ├── theme/           # App theming and styling
│   └── utils/           # Utilities (colors, sizes, date/time)
├── features/            # Feature modules (following feature-first approach)
│   ├── auth/            # Authentication (phone auth, sign in)
│   ├── home/            # Home with role-based dashboards
│   │   ├── admin/       # Admin-specific features
│   │   ├── faculty/     # Faculty-specific features
│   │   └── student/     # Student-specific features
│   └── splash/          # Splash screen
├── l10n/                # Localization files
├── shared/              # Shared components
│   ├── api_client/      # Dio HTTP client setup
│   ├── pods/            # Shared Riverpod providers
│   ├── riverpod_ext/    # Riverpod extensions and utilities
│   └── widget/          # Reusable widgets
└── firebase_options*.dart # Firebase configuration per environment
```

### Key Architectural Patterns

1. **Feature-First Architecture**: Each feature is self-contained with its own:
   - Controllers (Riverpod StateNotifier/AsyncNotifier)
   - Models
   - Repository (when applicable)
   - Views (UI)

2. **State Management**: Uses Riverpod with:
   - StateNotifier for complex state
   - FutureProvider/StreamProvider for async data
   - StateProvider for simple state

3. **Dependency Injection**: All dependencies managed through Riverpod providers

4. **Routing**: Declarative routing with AutoRoute, routes defined in `core/router/router.dart`

5. **Storage**: 
   - Remote: Firebase Firestore
   - Local: Hive boxes for offline caching
   - Secure storage for sensitive data

6. **Environment Configuration**: Multiple entry points for different environments:
   - `main.dart` - Production
   - `main_development.dart` - Development
   - `main_staging.dart` - Staging

### Important Patterns

- **Bootstrap Pattern**: All app initialization happens in `bootstrap.dart`
- **Global Error Handling**: Talker logger for error tracking
- **Responsive Design**: ResponsiveFramework for adaptive layouts
- **Theme Controller**: Dynamic theme switching with persistence
- **Locale Management**: Dynamic locale switching with persistence
- **Internet Connectivity**: Automatic monitoring with UI feedback

### Testing Strategy

- Unit tests for business logic (controllers, repositories)
- Widget tests for UI components
- Test helpers in `test/helpers/` for common test utilities
- Mock implementations using Mocktail

### Code Generation

The project uses several code generation tools:
- **AutoRoute**: Generates routing code from annotations
- **Hive**: Generates type adapters for local storage
- **JsonSerializable**: Generates JSON serialization code

Always run code generation after modifying:
- Route definitions
- Hive models
- JSON serializable models