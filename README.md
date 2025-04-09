# MeetMax - Social Media App

MeetMax is a social media application built with Flutter, implementing the Model-View-ViewModel (MVVM) pattern with GetX for state management. The project simulates essential social media functionalities, enabling seamless user interaction. Authentication and feed display are fully implemented, with backend responses to ensure smooth functionality.

## App Link
[Download Meetmax](https://drive.google.com/file/d/1KZr5sPNAt4gdVywU36X2CsUlwxXdtOQW/view?usp=sharing)

## Project Details

- **Project Name**: MeetMax
- **Description**: A simple, user-friendly social media app with core features like authentication, posting, liking posts, and viewing feeds.
- **Version**: 1.0.0+1

## Table of Contents
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Folder Structure](#folder-structure)
- [Architecture](#architecture)
- [Simulated Backend](#simulated-backend)
- [Assumptions and Limitations](#assumptions-and-limitations)
- [Contributing](#contributing)

---

## Features

### Implemented
- **User Authentication**: Comprehensive form validation for login and signup screens, forgot password, ensuring secure and accurate input.
- **Feed Screen**: Displays a feed of posts for authenticated users, in line with Figma design specifications.
- **Post Interactions**: Like and create new posts (comment and react features not implemented).
- **State Management**: Real-time updates within the application using GetX.
- **Dependency Injection**: Efficient object creation and management through dependency injection with GetX.
- **Responsive Design**: Adaptive layout for different screen sizes using `flutter_screenutil`.
- **Persistent Navigation**: Bottom navigation bar using `persistent_bottom_nav_bar`.

### Optional (Not Implemented)
- **Comments** and **Reactions**: Currently excluded.

## Requirements

To run MeetMax locally, ensure you have:
- **Flutter SDK**: Version 3.5.3 or later
- A compatible IDE such as **Visual Studio Code** or **Android Studio**
- An emulator or physical device with Android or iOS support

## Installation

1. **Clone the repository**:
    ```bash
    git clone https://github.com/Noctambulist007/meetmax.git
    cd meetmax
    ```

2. **Install dependencies**:
    ```bash
    flutter pub get
    ```

3. **Run the app**:
    ```bash
    flutter run
    ```
   
Architecture
MeetMax uses the MVVM pattern:

Model: Represents data models, encapsulating post, user, and authentication data.
View: Flutter widgets render the UI, fetching data from the ViewModel via controllers.
ViewModel: Contains business logic and manages communication between models and views. GetX controllers are used to update UI elements in real time.
State Management
GetX: GetX controllers handle state management efficiently, providing dependency injection and simplified navigation.
Simulated Backend
With live backend, simulate user authentication and feed data:


Contributing
We welcome contributions! If you'd like to make updates, please fork the repository and submit a pull request with your proposed changes.
