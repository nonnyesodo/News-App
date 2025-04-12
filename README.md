# 📰 Kagi News Aggregator (Flutter)

A native Flutter news aggregator app that fetches and displays categorized news using [Kagi's Kite](https://kite.kagi.com/kite.json) API. Inspired by Apple News and 1440 Quill, the app focuses on delivering a fast, intuitive, and joyful native experience beyond traditional PWAs or web views.

## ✨ Features

- 📂 Category-based news feed (e.g. World, Tech, Business)
- 📰 Beautiful list of articles with source, date, and title
- 📱 Smooth native interactions and transitions
- 📄 Detailed article view with summary
- 🧭 Responsive UI for both iOS and Android
- 😌 Empty state screens when no news is available
- 💥 Graceful error handling and loading states

## 📸 Screenshots

> Add actual screenshots here after building the app

| Category List | Article Details | Empty State |
|---------------|-----------------|-------------|
| ![Category](screenshots/category.png) | ![Detail](screenshots/detail.png) | ![Empty](screenshots/empty.png) |

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.10+ recommended)
- Dart (Usually bundled with Flutter)
- Android Studio / Xcode / VSCode for IDE
- An emulator or physical device

### Setup Instructions

```bash
# Clone the repo
git clone https://github.com/your-username/kagi-news-aggregator.git
cd kagi-news-aggregator

# Get dependencies
flutter pub get

# Run the app
flutter run
```

 

 
## 🔍 Technical Highlights

- Uses `http` for network requests
- JSON decoding from [Kagi API](https://kite.kagi.com/)
- Custom models for articles and categories
 
- Platform-aware UI design
- State management via `Bloc`  

 
## 📦 Deployment

- Available on TestFlight / Google Play (Add links here if deployed)

## 🧠 Inspiration

- [Apple News](https://apps.apple.com/us/app/apple-news/id1066498020)
- [1440 Quill](https://apps.apple.com/us/app/1440-quill-daily-newsletter/id1669557131)
- [Kagi Kite](https://kite.kagi.com/)

 

## 🧑‍💻 Author  
 • [GitHub](https://github.com/yourusername)
