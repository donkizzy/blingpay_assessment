# blingpay_assesment

A new Flutter project.

## Getting Started

### Flutter Project: Bling Social
This README outlines the approach taken for developing the Bling Social app, It details the project's functionalities, architecture, testing strategies, and known limitations.


#### Project Description:
The purpose of this project was to fetch a list of users and their posts and display it to the users in a friendly and appealing manner


### Tech Stack:

Flutter version:  **3.22.2**

Dependencies:

- [Cached Network Image](https://pub.dev/packages/cached_network_image) : This package helps with caching images on the devices of the User and saves them memory as they do not need to fetch if it has already been cached
- [Equatable](https://pub.dev/packages/equatable) : Equatable overrides == and hashCode for you so you don't have to waste your time writing lots of boilerplate code.
- [Flutter Bloc](https://pub.dev/packages/flutter_bloc) : Flutter Bloc is a State management package that helps build fast and reactive applications
- [Shimmer](https://pub.dev/packages/shimmer) : Shimmer is a skeleton loader package that helps make Intuitive loaders
- [Flutter Lint](https://pub.dev/packages/flutter_lints) : Flutter Lints is a linting package that contains all the flutter recommended best practices to ensure quality coding practices
- [Better Player](https://pub.dev/packages/better_player) : Better Player is an Advanced video player. It solves many typical use cases and it's easy to run.
- [google_fonts](https://pub.dev/packages/google_fonts) : This package helps with using google fonts in flutter
- [adaptive_theme](https://pub.dev/packages/adaptive_theme) : This package helps with making the app theme adaptive to the device's theme
- [firebase_core](https://pub.dev/packages/firebase_core) : Flutter plugin for Firebase Core, enabling connecting to multiple Firebase apps. 
- [buttons_tabbar](https://pub.dev/packages/buttons_tabbar) : Flutter package that provides a tabbar where each tab indicator is a toggle button. It allows you to create interactive and customizable tab bars for your Flutter applications.
- [bloc_test](https://pub.dev/packages/bloc_test) : A Dart package that makes testing blocs and cubits easy. 
- [build_runner](https://pub.dev/packages/build_runner) : A Dart package that makes easy to generated files in dart
- [mockito](https://pub.dev/packages/mockito) : Mock library for Dart that allows generating of Mock Implementation of classes for testing 
- [fake_cloud_firestore](https://pub.dev/packages/fake_cloud_firestore) : Fake Cloud Firestore helps with creating a cMocked Instance of Cloud Firestore for easy testing 

- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) : This package helps with managing enviroment variables in a Dart/Flutter app


### Project Architecture:

This project uses a feature first folder strcuture and BLOC for its architecture
![](https://bloclibrary.dev/_astro/bloc_architecture_full.CYn-T9Ox_Z20Hwr9.webp)

Using the BLOC architecture allows us to separate our application into three layers:

- Presentation : The presentation layer’s responsibility is to figure out how to render itself based on one or more bloc states. In addition, it should handle user input and application lifecycle events.


- Business Logic: The business logic layer’s responsibility is to respond to input from the presentation layer with new states. This layer can depend on one or more repositories to retrieve data needed to build up the application state.


- Repository : This layer is the lowest level of the application and interacts with databases, network requests, and other asynchronous data sources.

### Testing

This project prioritizes code quality and maintainability through a test-driven approach.

We utilize the flutter_test package bundled with the flutter for testing the repositories and models and bloc_test for testing the cubits

This project also has 100% test coverage

### Known Limitations
The video player doesn't work on the simulator but works great on a physical device

### Getting Started:

- Clone the repository:

	`git clone https://github.com/donkizzy/blingpay_assessment.git`
	
- Add the env file in the root folder for the project

- Install dependencies:


 `flutter pub get`
 
- Run the application:

	`flutter run`
	
-  Run Tests


 	`flutter pub run build_runner build`
 	
 	 `flutter test`











