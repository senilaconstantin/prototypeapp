# Health & Fitness Mobile Application

## Overview

The **Health & Fitness iOS Application** is designed to provide users with an intuitive platform for monitoring their health, including real-time heart rate tracking and personalized diet and fitness plans. 
The app leverages modern iOS development tools to ensure a smooth and responsive user experience.

---

## Features

- **User Authentication:** Secure login and registration functionalities.
- **Real-Time Heart Rate Display:** Fetches and displays heart rate data sent from the backend.
- **Personalized Plans:** Users can view customized diet and fitness plans based on their health data.
- **Local Data Storage:** Essential user preferences and settings are securely stored using `UserDefaults`.
- **SwiftUI Interface:** A sleek and modern design built with SwiftUI to ensure optimal usability and performance.

![14EF9274-102F-4602-ACDD-68AA6B32F2E7_1_105_c](https://github.com/user-attachments/assets/a44cff23-5a37-4a07-8f61-7a737eb923a2)


---

## Technologies Used

- **Swift:** The primary programming language used for the application.
- **SwiftUI:** Framework for designing the user interface in a declarative style.
- **Alamofire:** A powerful Swift networking library used to handle API requests to the backend.
- **UserDefaults:** Used for lightweight local storage of essential user preferences.

---

## Application Architecture

The mobile application follows a modular architecture to ensure code clarity and scalability:

1. **Networking Layer:** Handles all HTTP requests and responses with the backend using Alamofire.
    - Example: The login API request to authenticate users.
    ```swift
    func login(model: LogInModel, responseLogIn: @escaping (_ data: Data?) -> Void) {
        let urlString = "\(ApiConstants.basePath)\(ApiConstants.URLEndpoint.login)"
        
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(urlString,
                   method: .post,
                   parameters: model,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
        .response { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let data):
                    responseLogIn(data)
                case .failure(let err):
                    print(err.localizedDescription)
                    responseLogIn(nil)
                }
            }
        }
    }
    ```

2. **Model-View-ViewModel (MVVM):** Implements the MVVM pattern for separation of concerns:
   - **Model:** Represents data structures such as user credentials or fitness plans.
   - **View:** UI components designed with SwiftUI.
   - **ViewModel:** Handles logic and acts as a bridge between the View and Model.

3. **Local Storage:** Stores essential data such as user preferences and minimal required settings using `UserDefaults`.

---

## Screens

1. **Login Screen:**
   - Users can log in securely with their credentials.
   
2. **Dashboard:**
   - Displays the user’s real-time heart rate, fetched from the backend.
   - Personalized fitness and diet plans are shown dynamically.

3. **Settings:**
   - Allows users to log out and manage locally stored preferences.
   - Includes options to update user preferences.

---

## Networking and Security

### Networking
- **Alamofire:** All API requests to the backend (e.g., login, fetching heart rate data, and retrieving plans) are handled using Alamofire for streamlined networking.
- **Endpoints:** The app interacts with endpoints exposed by the backend, such as:
  - `/login` for authentication.
  - `/heart-rate` for fetching real-time heart rate data.
  - `/plans` for diet and fitness recommendations.

### Security
- **Secure Communication:** All data transmitted between the app and the backend is encrypted using HTTPS.
- **Minimal Local Storage:** Only essential data is stored locally, reducing security risks. Authentication tokens are handled securely in memory during the app’s lifecycle.

---

## Local Storage

The app uses `UserDefaults` for lightweight and secure storage of essential user data and preferences, such as:
- **User Settings:** Preferences for application behavior.
- **Basic Information:** Non-sensitive data required for the app to function efficiently.

Example:
```swift
UserDefaults.standard.set("somePreference", forKey: "userPreference")
```
![F171C2A3-F471-458A-A965-32246A114E4F_1_106_c](https://github.com/user-attachments/assets/c71176b5-e06c-4b40-9a89-17f2a9bb8cfe)

![[Watch the video](https://img.youtube.com/vi/_5tFXJQIzi4/0.jpg)]([https://www.youtube.com/watch?v=_5tFXJQIzi4](https://youtube.com/shorts/456uogp4eRI?feature=share))
