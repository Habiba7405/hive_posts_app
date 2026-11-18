# Hive Posts App

## 📌 Project Overview

Hive Posts App is a Flutter application that fetches posts from an online API and stores them locally using Hive database.

The application supports offline access, allowing users to view previously loaded posts even without an internet connection. Users can also add and remove posts from their Favorites list.

## ✨ Features

- **Fetch Posts from API:** Retrieves posts from an online API.
- **Display Posts:** Displays posts with their ID, title, and body.
- **Local Storage:** Saves posts locally using Hive.
- **Offline Mode:** Loads previously saved posts when there is no internet connection.
- **Refresh:** Allows users to refresh posts and fetch the latest data from the API.
- **Favorites:** Users can add posts to their Favorites list.
- **Remove Favorites:** Users can remove posts from Favorites directly.
- **Persistent Storage:** Favorites remain saved even after closing and reopening the application.
- **Real-time Updates:** Favorite icons update automatically when posts are added or removed from Favorites.

## 🛠️ Technologies Used

- Flutter
- Dart
- Hive
- Hive Flutter
- HTTP
- REST API

## 📂 Project Structure

```text
lib/
│
├── main.dart
│
├── models/
│   ├── post.dart
│   └── post.g.dart
│
├── screens/
│   ├── posts_screen.dart
│   └── favorites_screen.dart
│
└── services/
    ├── api_service.dart
    └── favorites_service.dart
```

### 1. Install Dependencies

Open the project folder in the terminal and run:

```bash
flutter pub get
```

### 2. Run the Application

Run the application using:

```bash
flutter run -d chrome --web-port=8080
```

The application will open in Google Chrome.

## 💾 Data Storage

The application uses two Hive boxes:

- **postsBox:** Stores posts fetched from the API for offline access.
- **favoritesBox:** Stores the user's favorite posts separately.

Both boxes are initialized before the application starts.

## 🌐 Online and Offline Behavior

**Online Mode:**
- The application fetches posts from the API.
- Successfully retrieved posts are saved in Hive.
- The terminal displays:

```text
Loaded from API
```

**Offline Mode:**
- If the API request fails, the application loads previously saved posts from Hive.
- The terminal displays:

```text
Loaded from Hive (Offline Mode)
```

## ⭐ Favorites Management

Users can:
- Add posts to Favorites from the Posts screen.
- Remove posts from Favorites using the star icon.
- See changes immediately on both screens.
- Keep their Favorites saved after restarting the application.

## 🧪 Testing

The following functionalities have been tested:

- Fetching posts from the API.
- Displaying posts.
- Refreshing posts.
- Saving posts locally using Hive.
- Loading saved posts without an internet connection.
- Adding and removing favorite posts.
- Synchronizing favorite icons between screens.
- Preserving Favorites after restarting the application.

## Screenshots and Explanations

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

