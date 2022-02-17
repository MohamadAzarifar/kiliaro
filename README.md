# kiliaro_test_album

Kiliaro Test Album.

This app was commissioned by Kiliaro to test programming skills.

## The Secret to Maintainable Apps
Keeping your code clean and tested are the two most important development practices. In Flutter, this is even more true than with other frameworks. On one hand, it's nice to hack a quick app together, on the other hand, larger projects start falling apart when you mix the business logic everywhere. Even state management patterns like BLoC are not sufficient in themselves to allow for easily extendable codebase.
This is where we can employ clean architecture. As proposed by our friendly Uncle Bob, we should all strive to separate code into independent layers and depend on abstractions instead of concrete implementations.
For more information, please check link below to understand implementing Clean Architecture with Flutter.
[ResoCoder](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)

## State Management in Flutter
In Flutter, we have different alternatives for managing the state.
For small projects, we can perfectly use the tools offered by the Framework (vanilla setState and StatefulWidget). The real problem arises when the project grows and needs to share certain information (which is part of the state) between different components (and in different places) throughout the application.
When we think about writing quality code, we have to present different concepts (non-functional requirements) such as maintainability, scalability, testability, and performance, among others.

### A brief introduction to BloC
BloC (Business Logic Component) is an architecture pattern created by Google and introduced at Google I/O 2018. Its main objective is to separate the business logic from the presentation layer through the use of Streams. This supports the Reactive Programming paradigm.
BloC promotes the separation of responsibilities. The Presentation layer interacts with the BloC by sending events, and it will be able to react to changes in the state by subscribing to the Stream of data that it exposes.
To implement this architecture pattern, we use the [flutter_bloc](https://bloclibrary.dev/) package created by Felix Angelov from Very Good Ventures. This library is very useful since it provides a model of how a BloC should be implemented and how events and the state should be defined.
It also has a package that facilitates the creation of unit tests on BLoC’s components. The library offers as well different variants, such as:
_hydrated_bloc (allows the state to persist through different life cycles apps)_
_replay_bloc (allows to undo/redo the state)._

## Dependency Injection
Keeping your widgets from having direct dependencies makes your code better organized and easier to test and maintain.
[get_it](https://pub.dev/packages/get_it) is a simple Service Locator for Dart and Flutter projects. It can be used instead of InheritedWidget or Provider to access objects.