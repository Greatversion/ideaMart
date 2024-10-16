---

# iDealMart - Grocery Shopping App

iDealMart is a beautifully designed Flutter application that enables users to browse and shop for groceries with ease. The app features a clean, user-friendly interface, with essential screens like login, product listing. 

## Features

- **Login Screen**: 
  - Email and password validation.
  - Toggle password visibility.
  - Loading indicator during login.
  - Navigation to the main product listing page after successful login.
  
- **Product Listing**: 
  - Grid-based layout to display grocery products.
  - Product filtering through search bar.
  
- **User Authentication**:
  - Login functionality using a form-based interface.
  - Forgot Password option (can be implemented later).

- **Navigation**: 
  - Smooth transitions between login and product pages.
  
## Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK**: [Get Started with Flutter](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (comes with Flutter).
- An IDE (such as **VSCode** or **Android Studio**) with Flutter and Dart plugins.

## Setup Instructions

1. **Clone the Repository**:
   Open a terminal and run the following command to clone the project:
   ```bash
   git clone https://github.com/yourusername/idealmart-app.git
   cd idealmart-app
   ```

2. **Install Dependencies**:
   Once inside the project directory, install the required packages:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   To run the app, use the following command:
   ```bash
   flutter run
   ```
   Make sure you have a device connected or an emulator running.


### Important Files

1. **`login_page.dart`**: Handles the user login flow with form validation, email, and password input fields, and a loading indicator.
2. **`product_list_screen.dart`**: Displays a grid of grocery products after a successful login. This screen will eventually pull product data (mocked or fetched from an API).
3. **`colors.dart`**: Defines the color scheme of the app, including the primary and accent colors.

### Future Enhancements

- **API Integration**: Implement services for fetching product data and handling user authentication.
- **Search and Filter**: Add functionality to search and filter products by category, price, etc.
- **Product Details**: Clicking on a product could open a detailed page with product information and the option to add it to the cart.
- **Cart Functionality**: Enable users to add products to the cart and checkout.

## Screenshots

<img src="https://github.com/user-attachments/assets/103004e7-972d-4ef5-ac3a-c15220e482e4"  width="200" />
<img src="https://github.com/user-attachments/assets/5aea39fe-c3fe-44ed-8695-2b1b130430a8"  width="200" />
<img src="https://github.com/user-attachments/assets/9e858b97-5b05-4bae-81f7-f1ac546687c8" width="200" />
<img src="https://github.com/user-attachments/assets/ed1a1486-5d1c-4aab-92c3-ca23889d9c95"  width="200" />
<img src="https://github.com/user-attachments/assets/2f54eccd-ce9a-4473-9f1d-57f40ff5a8c4"  width="200" />
<img src="https://github.com/user-attachments/assets/2fc80ed7-6f86-430f-8407-7421dccb0e00"  width="200" />
<img src="https://github.com/user-attachments/assets/eeace9ee-018f-437b-8637-41b97b7a8cc1"  width="200" />
<img src="https://github.com/user-attachments/assets/f01dc5dc-477a-4c20-8fc2-7c74f38c665a" width="200" />
<img src="https://github.com/user-attachments/assets/554ae205-5721-4bfc-89c7-fa6b1557e436"  width="200" />
<img src="https://github.com/user-attachments/assets/4ecae5a7-9c85-4696-8188-e2a6c73832dd"  width="200" />
<img src="https://github.com/user-attachments/assets/a6697448-64c2-4e40-86d5-8da35b0c8228"  width="200" />







## Running on iOS and Android

To run on **iOS**, ensure you have **Xcode** installed and set up properly. For **Android**, ensure you have an emulator running or a physical device connected.

```bash
# Run on Android
flutter run

# Run on iOS
flutter run
```

## Dependencies

This app relies on the following main packages:

- `flutter`: The framework for building beautiful UIs.
- `email_validator`: Used for validating email input.

Check the complete list of dependencies in `pubspec.yaml`.

