import 'package:cubit/cubit.dart';
import 'package:duas_pwa/repository/repository.dart';

/// manage state theme using cubit by defining a [Cubit<bool>]
/// the state of [true] indicated dark theme whereas [false] is
/// for light theme
class ThemeCubit extends Cubit<bool> {
  /// custructor takes an optional [initialTheme] bool value
  /// which makes this flexible to take set initial state
  /// based on local storage value
  ThemeCubit({
    bool initialTheme,
  }) : super(initialTheme ?? false);

  /// theme repository to store theme changes
  final ThemeRepository _themeRepository = ThemeRepository();

  /// set theme state to [themeValue] also stores those changes
  /// in local storage
  void toggleTheme(bool themeValue) {
    // store theme value in local storage
    _themeRepository.save(themeValue ? "dark" : "light");
    // emit states simply meaning notifies builders
    // to adapt changes
    emit(themeValue);
  }
}
