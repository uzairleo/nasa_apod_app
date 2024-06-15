# NASA APOD Viewer 

NASA APOD is a Flutter application that displays NASA's Astronomy Picture of the Day (APOD). This app allows users to browse through the APODs, view details, search by title, and supports offline access with caching.

## Features

- 👨‍💻 TDD with Clean Architecture and MVVM approach

- 🌠 View the latest APODs with title, date, and image
 
- 🔍 Search APODs by title

- 📄 Pagination and pull-to-refresh functionality

- 🧩 State management using GetX

- 🗃️ Dependency injection with GetIt

- 📡 Offline access with caching of APODs

- 👍 User-friendly experience for error states)

## Purpose

This project was developed by [uzairleo](https://uzairleo.tech/) as a technical assessment for CloudWalk. It demonstrates the use of various Flutter development practices, including Test-driven development with MVVM & state management, API integration, and offline support.

## Getting Started

### Prerequisites

- Flutter SDK (Flutter 3.19.6 • channel stable • [Flutter GitHub](https://github.com/flutter/flutter.git))
  - Framework • revision 54e66469a9 (8 weeks ago) • 2024-04-17 13:08:03 -0700
  - Engine • revision c4cd48e186
  - Tools • Dart 3.3.4 • DevTools 2.
- NASA API Key: [Get your NASA API Key](https://api.nasa.gov)

https://github.com/uzairleo/nasa_apod_app/assets/52172428/daf2a768-0604-419c-bdd7-5c036cf2f785


https://github.com/uzairleo/nasa_apod_app/assets/52172428/44f44e99-7528-4dbe-8e52-9a3a9e2a24bf

### Installation

1\. Clone the repository:

```bash

   git clone https://github.com/yourusername/nasa_apod_viewer.git

   cd nasa_apod_viewer

```

2\. Install dependencies:

```bash

   flutter pub get

```

3\. Run the application:

```bash

   flutter run

```

## Running Tests

To run unit and widget tests:

```bash

flutter test

```

## Documentation

### API Integration

The application uses NASA's APOD API to fetch data. Ensure you have a valid API key from [NASA API](https://api.nasa.gov).

### State Management

The application uses GetX for state management, providing a simple and reactive way to manage state across the application.

### Caching

GetStorage is used for caching the APODs to provide offline access .

## Commit History

The following is a summary of the commit history that outlines the development process of the project:

1\. **Initial Project Setup**:

```plaintext

   0b24a77 🎉 init: initial commit

   32b71f5 🛠️ setup: initialize TDD Clean Architecture with MVVM

   620116a 🐳 chore(pubspec): Add dependencies

   5fc20b4 Merge pull request #1 from uzairleo/setup/tdd-mvvm-architecture

   c55cae1 ✨ feat: setup GetX for state management and add test viewmodels

   c9fef73 🐛 fix: minor correction in test.dart

```

2\. **UI Implementation**:

```plaintext

   b8fd091 🎨 feat: integrate APOD list view screen UI

   e8bb84d Merge pull request #3 from uzairleo/feature/apod-listview-ui

   04f4bfa 🎨 feat: integrate APOD detail view screen UI

   07830d0 Merge pull request #4 from uzairleo/feature/apod-detail-ui

```

3\. **API Integration**:

```plaintext

   64eb99f 🚀 feat: Integrate API with remote data source, domain layer, and ViewModel

   b517ee2 🔧 feat: Add dependency injection with GetIt and set up services

   0033b44 Merge pull request #5 from uzairleo/feature/apodlistview-api-integration

```

4\. **ViewModel and UI Connection**:

```plaintext

   a030ddf ✨ feat: Connect ViewModel APOD response to UI with improvements

   00cd6bd Merge pull request #6 from uzairleo/feature/connect-viewmodel-to-ui

```

5\. **Search Functionality**:

```plaintext

   36001d7 🔍 feat: Implemented search functionality in APOD list

   029686d Merge pull request #7 from uzairleo/feature/search-implementation

```

6\. **Pagination and Pull-to-Refresh**:

```plaintext

   a2ecb2a ✨ feat: Implement pagination and FAB to scroll to top

   727deba Merge pull request #8 from uzairleo/feature/pagination-integration

   dee7cec 🐳 chore(pubspec): Add dependencies

   840b548 Merge pull request #9 from uzairleo/feature/pagination-integration

   5c3a5f8 🐳 chore(pubspec): updated dependencies

   4753771 ✨ feat: Implemented pull-to-refresh and optimize pagination

   43795c4 Merge pull request #10 from uzairleo/feature/pulltorefresh-integ

```

7\. **Local Storage and Offline Support**:

```plaintext

   1a27f09 ✨ feat: Add LocalStorageService and integrate with dependency injection

   1f27bf1 ✨ feat: Implement APOD data caching and offline support

   7492266 Merge pull request #11 from uzairleo/feature/local-storage-service

```

8\. **Refactoring**:

```plaintext

   613ba86 ♻️ refactor: Rename LocalStorageService to CacheStorageService

   8511d44 Merge pull request #12 from uzairleo/refactor/cache-storage-service

```

9\. **User-Friendly Messages**:

```plaintext

   19cd5e0 ✨ feat: Add user-friendly message for empty APOD list

   fdac390 Merge pull request #13 from uzairleo/feature/empty-apod-list-message

```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
