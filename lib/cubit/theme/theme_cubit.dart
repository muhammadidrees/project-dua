import 'package:cubit/cubit.dart';

/// manage state theme using cubit
class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  void toggleTheme(bool themeValue) => emit(themeValue);
}
