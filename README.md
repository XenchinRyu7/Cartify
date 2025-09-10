# 🛒 Cartify - Modern E-commerce Mobile App

A modern, scalable e-commerce mobile application built with Flutter following Clean Architecture principles. Cartify provides a beautiful and intuitive shopping experience with a focus on performance and maintainability.

## ✨ Features

### 🏠 **Home Screen**
- Modern product grid layout with beautiful cards
- Category filtering with animated chips
- Search functionality with real-time filtering
- Product ratings and reviews display
- Sale badges and price comparisons
- Smooth animations and transitions

### 📱 **Product Detail Screen**
- High-quality product image gallery
- Comprehensive product information
- Detailed specifications and descriptions
- Customer reviews and ratings
- Quantity selector with add to cart
- Wishlist functionality
- Tabbed interface for organized content

### 🛍️ **Shopping Cart**
- Interactive cart management
- Quantity adjustment with real-time updates
- Order summary with tax and shipping calculations
- Remove items with undo functionality
- Checkout flow integration
- Empty cart state with call-to-action

### 🎨 **Modern UI/UX**
- Clean, minimal design with lots of white space
- Professional color palette (Indigo primary, Amber secondary)
- Smooth animations and micro-interactions
- Material Design 3 components
- Responsive layout for different screen sizes
- Dark mode support (ready for implementation)

## 🏗️ Architecture

Cartify follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                    # Core functionality
│   ├── constants/          # App constants and configuration
│   ├── di/                 # Dependency injection setup
│   ├── theme/              # App theme and styling
│   └── utils/              # Utility functions
├── domain/                 # Business logic layer
│   ├── entities/           # Core business objects
│   ├── repositories/       # Repository interfaces
│   └── usecases/          # Business use cases
├── data/                   # Data layer
│   ├── datasources/        # API and local data sources
│   ├── models/             # Data models
│   └── repositories/       # Repository implementations
└── presentation/           # UI layer
    ├── bloc/               # State management
    ├── screens/            # App screens
    └── widgets/            # Reusable UI components
```

## 🛠️ Tech Stack

### **Core Technologies**
- **Flutter 3.9.2+** - Cross-platform mobile development
- **Dart** - Programming language

### **State Management**
- **flutter_bloc** - Predictable state management
- **equatable** - Value equality for objects

### **Dependency Injection**
- **get_it** - Service locator
- **injectable** - Code generation for DI

### **Network & API**
- **dio** - HTTP client
- **retrofit** - Type-safe REST client
- **json_annotation** - JSON serialization

### **Local Storage**
- **sqflite** - SQLite database
- **shared_preferences** - Key-value storage

### **UI & Styling**
- **google_fonts** - Custom typography
- **flutter_svg** - SVG support
- **animations** - Smooth animations
- **cached_network_image** - Image caching

### **Development Tools**
- **build_runner** - Code generation
- **flutter_lints** - Code quality
- **json_serializable** - JSON code generation

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.9.2 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / VS Code
- Android device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/XenchinRyu7/cartify.git
   cd cartify
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Screenshots

### Home Screen
- Product grid with modern cards
- Category filtering
- Search functionality
- Cart badge with item count

### Product Detail
- Image gallery with thumbnails
- Product information tabs
- Reviews and ratings
- Add to cart with quantity

### Shopping Cart
- Item management
- Order summary
- Checkout flow
- Empty state handling

## 🎨 Design System

### Color Palette
- **Primary**: Indigo (#6366F1) - Modern, trustworthy
- **Secondary**: Amber (#F59E0B) - Warm, energetic
- **Accent**: Emerald (#10B981) - Success, growth
- **Neutral**: Professional grays for text and backgrounds

### Typography
- **Font Family**: Inter (Google Fonts)
- **Hierarchy**: Clear text scale from headlines to captions
- **Weights**: 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold)

### Components
- **Cards**: Rounded corners (16px), subtle shadows
- **Buttons**: Rounded (12px), proper padding
- **Input Fields**: Rounded (12px), clear focus states
- **Chips**: Rounded (20px), animated selection

## 🔧 Configuration

### Environment Setup
Update `lib/core/constants/app_constants.dart` for:
- API base URL
- Database configuration
- Feature flags
- App metadata

### Theme Customization
Modify `lib/core/theme/app_theme.dart` for:
- Color schemes
- Typography settings
- Component themes
- Animation durations

## 📦 Dependencies

### Production Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  google_fonts: ^6.2.1
  flutter_svg: ^2.0.10+1
  animations: ^2.0.11
  flutter_bloc: ^8.1.6
  equatable: ^2.0.5
  get_it: ^7.7.0
  injectable: ^2.4.2
  dio: ^5.4.3+1
  retrofit: ^4.1.0
  json_annotation: ^4.8.1
  sqflite: ^2.3.2
  path: ^1.9.0
  shared_preferences: ^2.2.3
  cached_network_image: ^3.3.1
```

### Development Dependencies
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  build_runner: ^2.4.9
  injectable_generator: ^2.6.2
  retrofit_generator: ^8.1.0
  json_serializable: ^6.7.1
```

## 🧪 Testing

Run tests with:
```bash
flutter test
```

Run analysis:
```bash
flutter analyze
```

## 🚀 Deployment

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design team for design guidelines
- Unsplash for beautiful product images
- All contributors and supporters

## 📞 Support

For support, email support@cartify.com or join our Discord community.

---

**Built with ❤️ using Flutter**