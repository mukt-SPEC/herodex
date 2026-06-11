# HeroDex

![Flutter](https://img.shields.io/badge/Flutter-3.9.2+-blue?logo=flutter)
![License](https://img.shields.io/github/license/mukt-SPEC/herodex)
![GitHub Stars](https://img.shields.io/github/stars/mukt-SPEC/herodex?style=social)
![Platform](https://img.shields.io/badge/platforms-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-brightgreen)

> A beautiful cross-platform Flutter app to explore and discover superheroes. Browse an extensive superhero database with stunning UI and seamless performance across all platforms.

## Features

- ✅ **Comprehensive Superhero Database** - Browse thousands of superheroes with detailed information
- ✅ **Cross-Platform Support** - Works flawlessly on Android, iOS, Web, macOS, Windows, and Linux
- ✅ **Responsive Design** - Optimized UI for all screen sizes and orientations
- ✅ **State Management** - Built with Provider for efficient and scalable state handling
- ✅ **Beautiful Typography** - Custom fonts powered by Google Fonts
- ✅ **Smooth Animations** - Polished UI with animated icons and transitions
- ✅ **Real-time API Integration** - Fetch live superhero data with HTTP requests

## Quick Start

Get up and running in 2 minutes:

```bash
# Clone the repository
git clone https://github.com/mukt-SPEC/herodex.git

# Navigate to directory
cd herodex

# Get dependencies
flutter pub get

# Run the app
flutter run
```

## Installation

### Prerequisites

- **Flutter SDK** 3.9.2 or higher
- **Dart** 3.9.2 or higher
- **Android SDK** (for Android development)
- **Xcode** (for iOS development on macOS)
- **Visual Studio Code** or **Android Studio** (recommended IDE)

### Steps

1. **Clone the repository**

```bash
git clone https://github.com/mukt-SPEC/herodex.git
cd herodex
```

2. **Install Flutter dependencies**

```bash
flutter pub get
```

3. **Configure your environment**

Ensure your Flutter installation is complete:

```bash
flutter doctor
```

This command checks your development environment and displays a report.

4. **Run the application**

For Android:
```bash
flutter run -d android
```

For iOS:
```bash
flutter run -d ios
```

For Web:
```bash
flutter run -d chrome
```

For Desktop (Windows/macOS/Linux):
```bash
flutter run -d windows
flutter run -d macos
flutter run -d linux
```

5. **Build for release**

```bash
# Android APK
flutter build apk

# iOS
flutter build ios

# Web
flutter build web

# Desktop
flutter build windows
flutter build macos
flutter build linux
```

## Usage

### Basic Example

```dart
import 'package:herodex/providers/superhero_provider.dart';
import 'package:provider/provider.dart';

// Access the superhero provider in your widget
class HeroListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SuperheroProvider>(
      builder: (context, superheroProvider, child) {
        return ListView.builder(
          itemCount: superheroProvider.heroes.length,
          itemBuilder: (context, index) {
            final hero = superheroProvider.heroes[index];
            return ListTile(
              title: Text(hero.name),
              subtitle: Text(hero.powerLevel.toString()),
            );
          },
        );
      },
    );
  }
}
```

### Fetching Data from API

```dart
// The SuperheroProvider handles HTTP requests
final provider = SuperheroProvider();

// Fetch all superheroes
await provider.fetchSuperheroes();

// Access the fetched data
final heroes = provider.heroes;

// Filter or search
final filtered = heroes.where((h) => h.name.contains('Super')).toList();
```

### Using Custom Fonts

```dart
import 'package:google_fonts/google_fonts.dart';

Text(
  'HeroDex',
  style: GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
)
```

### Working with Icons

```dart
import 'package:icons_plus/icons_plus.dart';
import 'package:lordicon/lordicon.dart';

// Use icons from icons_plus
Icon(IonIcons.star)

// Use animated icons from lordicon
Lordicon(
  icon: 'https://cdn.lordicon.com/...',
  trigger: LordiconTrigger.hover,
)
```

## Project Structure

```
herodex/
├── android/           # Android platform code
├── ios/               # iOS platform code
├── linux/             # Linux desktop code
├── macos/             # macOS desktop code
├── windows/           # Windows desktop code
├── web/               # Web platform code
├── lib/
│   ├── main.dart      # App entry point
│   ├── screens/       # UI screens
│   │   └── home.dart
│   ├── providers/     # State management
│   │   └── superhero_provider.dart
│   ├── models/        # Data models
│   ├── services/      # API services
│   └── widgets/       # Reusable widgets
├── assets/
│   └── images/        # Image assets
├── pubspec.yaml       # Dependencies and configuration
└── README.md          # This file
```

## Configuration

### pubspec.yaml

Key dependencies in this project:

| Package | Version | Purpose |
|---------|---------|---------|
| flutter | latest | Core Flutter framework |
| provider | ^6.1.5+1 | State management |
| http | ^1.6.0 | HTTP requests for API calls |
| google_fonts | ^6.3.2 | Custom typography |
| icons_plus | ^5.0.0 | Icon library |
| lordicon | ^1.0.3 | Animated icons |
| cupertino_icons | ^1.0.8 | iOS-style icons |

## Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Analyze code
flutter analyze

# Format code
flutter format .

# Lint code
dart fix --dry-run
dart fix
```

## Contributing

Contributions are welcome! Here's how to get started:

1. **Fork the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/herodex.git
   cd herodex
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```

3. **Make your changes**
   - Follow Flutter best practices
   - Use Provider for state management
   - Keep code clean and well-documented

4. **Commit your changes**
   ```bash
   git commit -m 'Add amazing feature'
   ```

5. **Push to the branch**
   ```bash
   git push origin feature/amazing-feature
   ```

6. **Open a Pull Request**
   - Describe your changes clearly
   - Reference any related issues
   - Ensure all tests pass

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and development process.

## Roadmap

- [x] Basic superhero database UI
- [ ] Advanced search and filtering
- [ ] Favorite heroes bookmarking
- [ ] Offline data caching
- [ ] Dark mode support
- [ ] Multi-language support
- [ ] User authentication
- [ ] Social sharing features
- [ ] Push notifications for new heroes

See [GitHub Issues](https://github.com/mukt-SPEC/herodex/issues) for the full list of proposed features and known issues.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flutter](https://flutter.dev) - Amazing cross-platform framework
- [Provider](https://pub.dev/packages/provider) - State management solution
- [Google Fonts](https://fonts.google.com) - Beautiful typography
- [Icons Plus](https://pub.dev/packages/icons_plus) - Comprehensive icon library
- [Lordicon](https://lordicon.com) - Animated icons
- Superhero API contributors and data sources

## Support

- 📧 **Email**: [Create an issue](https://github.com/mukt-SPEC/herodex/issues) for bug reports
- 🐛 **Issues**: [GitHub Issues](https://github.com/mukt-SPEC/herodex/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/mukt-SPEC/herodex/discussions)
- 📖 **Documentation**: Check the [Wiki](https://github.com/mukt-SPEC/herodex/wiki)

## Authors

- **mukt-SPEC** - *Initial work* - [GitHub](https://github.com/mukt-SPEC)

See also the list of [contributors](https://github.com/mukt-SPEC/herodex/contributors) who participated in this project.

---

Made with ❤️ by the HeroDex team
