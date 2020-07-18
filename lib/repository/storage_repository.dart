part of 'repository.dart';

/// This repository is responsible for saving theme changes in the pwa
/// window so the theme changes persist
class ThemeRepository {
  // initialize local storage instance
  final Storage _localStorage = window.localStorage;

  /// save/update theme string value as only type string is supported
  /// therefore using values of [light] and [dark] strings for themes
  Future save(String theme) async {
    _localStorage['theme'] = theme;
  }

  /// fetch theme data from the local storage if no data is available
  /// returns ["light"] as the default theme
  Future<String> getTheme() async => _localStorage['theme'] ?? "light";
}
