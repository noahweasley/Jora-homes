# Jora Homes App

This README file provides an overview of the Banking App with features included as instructions stated below developed for the technical assessment at Moniepoint Group

## Getting Started

To get started with the project, follow the steps below:

### Prerequisites

- **Flutter SDK**: Install the latest stable version of Flutter. The project uses this constraints: SDK >=3.0.5 <4.0.0. But installing the latest version of Flutter would run everything just fine.
- **Android Tools**: The app targets Android API level **30** (this should have been updated to target the latest, but time didn't allow for that), so ensure that you have installed Android command line tools and everything related to it using Android Studio
- **Dart**: Ensure you have Dart programming language installed along with the Flutter SDK.
- **IDE**: Choose an Integrated Development Environment (IDE) for Flutter development.

### Installation

1. Clone the project repository using the following command:

   ```
   git clone https://github.com/noahweasley/jora-homes.git
   ```
2. Navigate to the project directory:

   ```
   cd jora-homes
   ```
3. Fetch the dependencies by running the following command:

   ```
   flutter pub get
   ```

## Build Tools

These are some of the tools used to build the application:

  To run the build runner and watch for future changes.
- Run launcher icon generation, flutter_launcher_icons package was used by running the command below:

  ```shell
  dart run flutter_launcher_icons
  ```

## Running the App For Debugging

To run the application, execute the following command in the project directory:

```
flutter run
```

_This will launch the application on an available emulator or connected device_

Visit this page: [How to Run Flutter app on android emulator](https://docs.flutter.dev/get-started/test-drive)

## Testing

**Tests weren't implemented for this project because of the time frame. The project includes only an empty test**

## Building the app

This project was tested on Web, and works on Android, iOS should work, but wasn't tested on the device. Making network calls on the app using Web generate errors because CORS isn't enabled.

### Building for Android

To build for Android without splitting the ABIs, execute the following command in the project directory:

```
flutter build apk
```

To build for Android splitting the ABIs, execute the following command in the project directory:

```
flutter build apk --split-abis
```

_Gradle download and some other project configurations would be performed in the background, so make sure you are connected to a stable internet connection_

## Project Structure

This section states the overall structure of the app, the architecture, working principle, logic, trade-offs and design of the UI

### SDK and Libraries

The banking application was built using Flutter. State management and Routing was built using GetX, Network API calls where made using Dio, and Local storage to disk was built using Hive.

### Architecture

The project uses a feature based folder structure, to ensure that if the application features grows, the complexity of the application remains reduced, basically structured as:

## App Design

This section aims to help the one assessing this, understand the thought process, design and every other thing concerning the app


## Conclusion

This readme provides a brief overview of the Flutter project, including setup instructions, project structure, and additional resources.
