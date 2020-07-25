import 'package:universal_html/js.dart' as js;
import 'package:duas_pwa/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void toggleTheme(bool themeValue, {bool test = false}) {
    // store theme value in local storage
    _themeRepository.save(themeValue ? "dark" : "light");
    // call on native functionality to make manifest changes
    // disable this line during unit test
    if (!test) {
      js.context.callMethod('toggleTheme', [themeValue]);
    }
    // emit states simply meaning notifies builders
    // to adapt changes
    emit(themeValue);
  }
}
