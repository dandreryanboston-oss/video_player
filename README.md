# Video Player

A Flutter video player application that provides a smooth and intuitive experience for playing and managing video content.

## 🎬 Features

- **Video Playback**: Smooth video playback with full controls
- **Fullscreen Mode**: Watch videos in immersive fullscreen experience
- **Responsive Design**: Works on multiple platforms (Windows, Web, Android, iOS)
- **Audio Controls**: Volume control and mute functionality
- **Loop Support**: Enable video looping
- **Video Captions**: Support for video captions and descriptions
- **Clean Architecture**: Well-organized code structure following best practices

## 🚀 Quick Start

### Prerequisites

- Flutter SDK 3.11.1 or higher
- Dart SDK 3.11.1 or higher

### Installation

1. Clone this repository:
```bash
git clone https://github.com/dandreryanboston-oss/video_player.git
cd video_player
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Platform-Specific Runs

**Windows Desktop:**
```bash
flutter run -d windows
```

**Web:**
```bash
flutter run -d chrome
```

**Android:**
```bash
flutter run -d android
```

**iOS (requires macOS):**
```bash
flutter run -d ios
```

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point
├── config/
│   └── theme/                         # App theming configuration
├── domain/
│   └── entities/                      # Business logic entities
├── presentation/
│   ├── providers/                     # State management providers
│   ├── screen/                        # App screens
│   └── widgets/
│       ├── video/                     # Video player widgets
│       │   └── fullscreen_player.dart # Fullscreen video player
│       └── shared/                    # Shared widgets
└── shared/
    └── data/                          # Shared data and utilities
```

## 🛠️ Dependencies

Key packages used in this project:

- **flutter_riverpod**: State management
- **video_player**: Video playback functionality
- **flutter_localizations**: Internationalization support

For a complete list, see `pubspec.yaml`.

## 🏗️ Architecture

This project follows the **Clean Architecture** pattern with:

- **Entities**: Core business logic models
- **Providers**: State management using Riverpod
- **Widgets**: UI layer components
- **Screens**: Full screen views

## 📝 Usage

### Playing a Video

```dart
FullscreenPlayer(
  videoUrl: 'assets/videos/sample.mp4',
  caption: 'Sample Video',
)
```

### Adding Videos

Place your videos in the `assets/videos/` directory and reference them in `pubspec.yaml`:

```yaml
assets:
  - assets/videos/
```

## 🔨 Building

Build release versions:

```bash
# Windows
flutter build windows

# Web
flutter build web

# Android APK
flutter build apk

# iOS
flutter build ios
```

## ✅ Testing

Run tests:
```bash
flutter test
```

## 🐛 Troubleshooting

### Flutter Command Not Found
If Flutter commands don't work:
1. Add `C:\flutter\bin` to your system PATH (Windows)
2. Restart your terminal

### Dependency Issues
Clear and reinstall dependencies:
```bash
flutter clean
flutter pub get
```

## 🤝 Contributing

Feel free to fork this project and submit pull requests for any improvements.

## 📄 License

This project is open source and available under the MIT License.

## 💬 Support

For issues and feature requests, please visit the [GitHub Issues](https://github.com/dandreryanboston-oss/video_player/issues) page.

---

**Happy coding! 🎉**
