# Kktc App Portal

A modern, colorful, and comprehensive Flutter mobile application for Cyprus (Kıbrıs) information and classifieds.

## Features

### 🏠 Home Page
- Modern gradient design with the specified color palette
- Quick access to main sections
- Featured categories and recent updates
- Navigation to all app sections

### 📚 Content Sections
- **Kıbrıs Genel Bilgi** - General information about Cyprus
- **Kıbrıs Türkçesi** - Turkish language specific to Cyprus
- **Kıbrıs Yemekleri** - Traditional Cypriot cuisine
- **Spor Kulüpleri** - Sports clubs and teams
- **Üniversiteler** - Universities and education
- **Hastaneler** - Hospitals and healthcare
- **Oteller ve Casinolar** - Hotels and casinos
- **Kıbrıs Efsaneleri** - Cypriot legends and folklore
- **Kıbrıs Şarkıları** - Cypriot music and songs
- **Sinemalar** - Cinemas and movies
- **AI Videolar** - AI-generated videos

### 🚗 Classifieds Section
#### ARABA (Cars)
- Current listings
- Traffic rules information
- Penalty system information
- Advanced filtering options:
  - Brand selection
  - Steering (left/right)
  - Body type
  - Fuel type
  - Transmission (automatic/manual)
  - Price range with currency selection

#### EMLAK (Real Estate)
- For sale properties
- For rent properties
- Land plots
- Office spaces

#### ELEKTRONİK (Electronics)
- General electronics listings
- Categorized by type (phones, computers, tablets, etc.)

### 👤 Profile Page
- User profile information
- Posted ads management
- Sold ads history
- Favorite ads collection
- Profile editing capabilities
- User activity statistics

### ⚙️ Settings Page
- General app settings
- Language and currency preferences
- Account management
- Contact information for app creators
- Support and feedback options

## Design Features

- **Modern UI**: Colorful, attention-grabbing design (not minimal)
- **Color Palette**: 
  - Primary: #4184BF
  - Secondary: #4B93BF
  - Accent: #08A64D
  - Warning: #F2A516
  - Danger: #F27405
- **Gradients**: Beautiful gradient backgrounds and cards
- **Soft Shadows**: Modern shadow effects for depth
- **Rounded Corners**: Consistent 12-20px border radius
- **Grid Layouts**: Organized content presentation
- **Card-based Design**: Clean, organized information display

## Technical Implementation

- **Flutter**: Latest stable version
- **Material 3**: Modern Material Design components
- **Responsive Design**: Works on all screen sizes
- **State Management**: Local state management with setState
- **Navigation**: Bottom navigation with tab-based content
- **Custom Widgets**: Reusable gradient and colored cards

## Project Structure

```
lib/
├── main.dart                 # Main application entry point
├── screens/                  # Application screens
│   ├── home_screen.dart     # Home page with navigation
│   ├── content_sections_screen.dart  # Content categories
│   ├── classifieds_screen.dart      # Classifieds with tabs
│   ├── profile_screen.dart          # User profile
│   └── settings_screen.dart         # App settings
├── utils/                   # Utility classes
│   ├── app_colors.dart     # Color definitions
│   └── app_theme.dart      # Theme configuration
└── widgets/                 # Reusable widgets
    └── gradient_card.dart  # Custom card components
```

## Getting Started

1. **Prerequisites**: Flutter SDK installed
2. **Clone**: Download the project files
3. **Dependencies**: Run `flutter pub get`
4. **Run**: Execute `flutter run` on your device/emulator

## Customization

The application is designed to be easily customizable:
- Colors can be modified in `lib/utils/app_colors.dart`
- Theme settings in `lib/utils/app_theme.dart`
- Content can be updated in respective screen files
- Navigation structure can be modified in `main.dart`

## Future Enhancements

- User authentication system
- Real-time notifications
- Offline data support
- Multi-language support
- Dark mode implementation
- Advanced search and filtering
- User reviews and ratings
- Payment integration for premium features

## Support

For support and feedback, contact the development team through the app's settings page.

---

**Kktc App Portal** - Your comprehensive guide to Cyprus! 🇨🇾
