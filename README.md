# Hello Social - Social Media App

Hello Social is a social media application built with Flutter, implementing the Model-View-ViewModel (MVVM) pattern with GetX for state management. The project simulates essential social media functionalities, enabling seamless user interaction. Authentication and feed display are fully implemented, with backend responses to ensure smooth functionality.

## Project Details

-   **Project Name**: Hello Social
-   **Description**: A simple, user-friendly social media app with core features like authentication, posting, liking posts, and viewing feeds.
-   **Version**: 1.0.0+1

## Table of Contents

-   [Features](#features)
-   [Requirements](#requirements)
-   [Installation](#installation)
-   [Folder Structure](#folder-structure)
-   [Architecture](#architecture)
-   [Simulated Backend](#simulated-backend)
-   [Assumptions and Limitations](#assumptions-and-limitations)
-   [Contributing](#contributing)

---

## Features

### Implemented

-   **User Authentication**: Comprehensive form validation for login and signup screens, forgot password, ensuring secure and accurate input.
-   **Feed Screen**: Displays a feed of posts for authenticated users, in line with Figma design specifications.
-   **Post Interactions**: Like and create new posts (comment and react features not implemented).
-   **State Management**: Real-time updates within the application using GetX.
-   **Dependency Injection**: Efficient object creation and management through dependency injection with GetX.
-   **Responsive Design**: Adaptive layout for different screen sizes using `flutter_screenutil`.
-   **Persistent Navigation**: Bottom navigation bar using `persistent_bottom_nav_bar`.

### Optional (Not Implemented)

-   **Comments** and **Reactions**: Currently excluded.

## Requirements

To run Hello Social locally, ensure you have:

-   **Flutter SDK**: Version 3.5.3 or later
-   A compatible IDE such as **Visual Studio Code** or **Android Studio**
-   An emulator or physical device with Android or iOS support

## Architecture

Hello Social uses the **Model-View-ViewModel (MVVM)** pattern:

-   **Model**: Represents data models (e.g., `User`, `Post`) and potentially data access logic (Repositories). Located typically within `lib/app/data/models/` and `lib/app/data/repositories/`.
-   **View**: Flutter widgets that render the UI. They observe the ViewModel for state changes and forward user interactions to the ViewModel. Located typically within `lib/app/modules/*/views/`.
-   **ViewModel**: Contains the presentation logic and state. It fetches data from the Model (Repositories), processes it, and exposes it to the View. GetX controllers (`GetxController`) serve as ViewModels. Located typically within `lib/app/modules/*/controllers/`.

### State Management

-   **GetX**: Used for state management, dependency injection, and routing.
    -   **State Management**: `GetxController` along with `Obx` or `GetBuilder` widgets are used to reactively update the UI.
    -   **Dependency Injection**: GetX Bindings (`lib/app/modules/*/bindings/`) are used to inject dependencies (like Controllers and Repositories) lazily when a route is accessed.
    -   **Routing**: GetX simplifies navigation between screens (`Get.toNamed()`, `Get.offAllNamed()`, etc.). Routes are defined in `lib/app/routes/`.

### Simulated Backend

As there's no live backend connected, the application simulates backend interactions:

-   **Authentication**: Login/Signup logic checks against hardcoded or mock credentials/data.
-   **Feed Data**: Post data is typically loaded from mock data sources or hardcoded lists within the repository or data provider layer (`lib/app/data/providers/` or mock repository implementations). This allows for UI development and testing without backend dependency.

