# User Directory App

A beautifully designed, corporate-style user directory Flutter application. The UI design is meticulously crafted utilizing design tokens and component layouts directly integrated from the Stitch MCP "Directory" project.

## 📸 Screenshots

|                              User Directory (Success)                              |                                 Connection Error (Retry)                                 |                                     Loading State                                     |
| :--------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------: |
| <img src="docs/screenshots/user_list.png" width="250" alt="User List Placeholder"> | <img src="docs/screenshots/error_screen.png" width="250" alt="Error Screen Placeholder"> | <img src="docs/screenshots/loading_screen.png" width="250" alt="Loading Placeholder"> |

> **Note:** Please place your actual screenshots in a `docs/screenshots/` folder and name them `user_list.png`, `error_screen.png`, and `loading_screen.png` to have them appear above.

## 🎯 Project Requirements: API Integration and Networking

### Learning Objectives:
- Understand how to fetch data from RESTful APIs.
- Learn to parse and display JSON data in Flutter.
- Handle network requests with proper error handling and UI indicators.

### Completed Tasks & Features:

**1. HTTP Requests and JSON Parsing**
- Used the `http` package to send requests to a public REST API (`https://reqres.in`).
- Safely parsed the received JSON response mapping it to a `UserModel` class.
- Displayed the user data using a bounded `ListView.separated`.

**2. Fetching and Displaying User Data**
- Built a primary User Directory Screen.
- Fetched user data securely using `flutter_dotenv` for seamless API key management.
- Beautifully displayed user details including name, email, and profile picture utilizing prominent circular avatars and distinct typography.

**3. Error Handling and Loading Indicators**
- Implemented robust error handling capturing failed API requests.
- Displayed appropriate error messages with an interactive "Retry" mechanism if the connection drops.
- Embedded a `CircularProgressIndicator` (loading spinner) showcasing activity while data is being fetched.

**4. Design System Integration (Bonus)**
- Followed an organized approach relying on design tokens (colors, spacing, layout) integrated directly from the Stitch MCP "Directory" spec.

## 🗂 Project Structure

The project emphasizes a clean separation of concerns:
- `lib/models/` - Data classes with robust `fromJson` mappings (e.g., `UserModel`).
- `lib/services/` - Separated API Service classes routing HTTP transactions securely.
- `lib/ui/screens/` - Modular UI screens orchestrating state.
- `lib/ui/design_system.dart` - Centralized Design Tokens ensuring visual harmony across the app.

## 🚀 Getting Started

### 1. Prerequisites
Ensure you have the Flutter SDK installed and configured on your machine.

### 2. Environment Setup
This project uses an API key to securely communicate with the backend. 
1. Create a `.env` file in the root directory.
2. Add your Reqres API key:
   ```env
   API_KEY=your_actual_api_key_here
   ```

### 3. Install Dependencies
Clean the workspace and fetch packages:
```bash
flutter clean
flutter pub get
```

### 4. Run the App
Launch the app on your preferred emulator or physical developer device:
```bash
flutter run
```

## 🧠 State Management Approach

The application uses Flutter's native `FutureBuilder`, which passively observes the `Future` returned by the `ApiService`. This completely decouples data orchestration from widget building, enabling a simple yet powerful interaction loop. When an error occurs (such as a network disconnection), pressing the "Retry" button efficiently re-initializes the `Future`, prompting a clean reload cycle.
