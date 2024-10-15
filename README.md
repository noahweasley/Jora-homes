<h1 align="center" style="border-bottom: none">
  <div>
      <img src="android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png?raw=true" width="80" />
  </div>
 Jora Homes App
</h1>

This README file provides an overview of the design replication of a real estate application for the technical assessment at Moniepoint Group.

> The app icon was designed by me 😊

## Getting Started

To get started with the project, follow the steps below:

### Prerequisites

- **Flutter SDK**: Install the latest stable version of Flutter. The project uses this constraints: SDK >=3.0.5 <4.0.0. But installing the latest version of Flutter would run everything just fine.
- **Android Tools**: The app targets Android API level 34. Also ensure that you have installed Android command line tools and everything related to it using Android Studio
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

## Running the App For Debugging

To run the application, execute the following command in the project directory:

```
flutter run
```

_This will launch the application on an available emulator or connected device_

Visit this page: [How to Run Flutter app on android emulator](https://docs.flutter.dev/get-started/test-drive)

## Testing

Only Widget tests was implemented. Integration and Unit Testing were not not implemented. Run:

```
flutter test
```

## Building the app

The app should work perfectly on iOS, but was only testing on Android.

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

## Architecture

The project uses GetX to manage state, which would be much more prefarable to using no State management library in larger projects. GetX uses the Model View Presenter architecture, which is very intuitive and is another form of the Model View Controller Architecture. Controllers contains all business logic in the application.

## SDK and Libraries used

- **get:** State management library
- **blurrycontainer**: Easy provisions for blur effect
- **flutter_animate**: Easy animations for any widget
- **flutter_screenutil**: Provides easy access to screen information
- **flutter_staggered_grid_view**: Better staggered list to display images. Similar to popular web-based Grids

## Conclusion

This readme provides a brief overview of the Flutter project, including setup instructions, project structure, and additional resources.
