# User Directory App

A beautifully designed, corporate-style user directory Flutter application. The UI design is meticulously crafted utilizing design tokens and component layouts directly integrated from the Stitch MCP "Directory" project.

## 📸 Screenshots

|                              User Directory (Success)                              |                                 Connection Error (Retry)                                 |                                     Loading State                                     |
| :--------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------: |
| <img width="484" height="970" alt="Screenshot 2026-05-22 at 8 07 15 PM" src="https://github.com/user-attachments/assets/8691c2bc-82c1-4547-ad52-6829d9e02f2e" />
| <img width="481" height="973" alt="Screenshot 2026-05-22 at 8 10 02 PM" src="https://github.com/user-attachments/assets/3c4c2979-01e2-4d96-8215-e567a84def80" />

| <img width="474" height="978" alt="Screenshot 2026-05-22 at 8 08 03 PM" src="https://github.com/user-attachments/assets/8633a874-d80d-4963-ba06-7bece6eccadc" />|



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
