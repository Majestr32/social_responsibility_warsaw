# Project Setup

This guide provides instructions to fetch, run, and build a Flutter project from GitHub.

## Prerequisites

1. **Flutter SDK**: Ensure you have Flutter installed. Follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install) if needed.
2. **Git**: Make sure Git is installed. Download and install from [Git-SCM](https://git-scm.com/).
3. **IDE**: An IDE like VS Code or Android Studio is recommended for Flutter development.

## Fetching the Project

1. **Clone the Repository**:
    ```sh
    git clone https://github.com/PandasCodi/social_responsibility_warsaw.git
    ```

2. **Fetch Dependencies**:
    ```sh
    flutter pub get
    ```

## Running the Project

1. **Connect a Device**: Ensure a device is connected (physical or emulator). To list connected devices, use:
    ```sh
    flutter devices
    ```

2. **Run the Project**:
    ```sh
    flutter run
    ```

## Building the APK (Android)

1. **Build APK**:
    ```sh
    flutter build apk --release
    ```

2. **Locate APK**: The APK will be located at `build/app/outputs/flutter-apk/app-release.apk`.

## Building for iOS

1. **Set Up Xcode**:
    - Ensure you have Xcode installed.
    - Open the project in Xcode:
      ```sh
      open ios/Runner.xcworkspace
      ```

2. **Build iOS**:
    ```sh
    flutter build ios --release
    ```

## Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [GitHub Documentation](https://docs.github.com/en)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
