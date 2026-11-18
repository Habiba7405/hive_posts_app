# Hive Posts App

## 1. Project Overview

Hive Posts App is a Flutter application that fetches posts from an online API and stores them locally using Hive.

The application allows users to view posts, refresh data, use the application offline, and manage their favorite posts.

Favorites and cached posts are stored locally, so users can access their saved data even without an internet connection.

## 2. Technologies Used

- Flutter
- Dart
- Hive
- Hive Flutter
- HTTP
- REST API

## 3. Main Features

- **API Integration:** Fetches posts from an online API.
- **Display Posts:** Displays posts with their ID, title, and body.
- **Refresh:** Allows users to fetch posts again from the API.
- **Local Storage:** Saves posts using Hive.
- **Offline Mode:** Displays previously cached posts without an internet connection.
- **Add Favorites:** Allows users to add posts to their Favorites list.
- **Remove Favorites:** Allows users to remove posts directly from the Favorites page.
- **Data Persistence:** Keeps posts and favorites saved after closing and reopening the application.

## 4. Screenshots and Explanations

### 1. Posts Online

This screenshot shows the Posts screen when the application is connected to the internet. Posts are fetched successfully from the API and displayed on the screen.

### 2. Favorites Added

This screenshot shows posts selected as favorites by clicking the star icon on the Posts screen.

### 3. Favorites Page

This screenshot shows the Favorites page, where users can view all posts they have added to their favorites.

### 4. Favorite Removed

This screenshot shows that a post has been removed from Favorites by clicking its star icon. The change is updated automatically.

### 5. Empty Favorites

This screenshot shows the Favorites page after all favorite posts have been removed. The application displays the message "No favorites yet".

### 6. Cached Posts Offline

This screenshot demonstrates Offline Mode. When there is no internet connection, the application loads previously saved posts from Hive instead of the API.

### 7. Favorites Offline

This screenshot shows that users can still access their saved favorite posts without an internet connection.

### 8. Favorites After Restart

This screenshot demonstrates data persistence. After closing and reopening the application, previously saved favorite posts are still available.

## 5. Local Database Storage

The application uses two Hive boxes:

- **postsBox:** Stores posts fetched from the API for offline access.
- **favoritesBox:** Stores posts selected by the user as favorites.

Hive allows the application to save data locally and retrieve it later without needing an internet connection.

## 6. How to Run the Project

### Step 1: Install Dependencies

flutter pub get

### Step 2: Run the Application

flutter run -d chrome --web-port=8080
