import 'package:duas_pwa/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Theme repository", () {
    test("When no data in storage retures a theme of 'light'", () async {
      final _repository = ThemeRepository();

      String result = await _repository.getTheme();

      expect("light", result);
    });

    test("If new theme is added to local storage it gets that theme", () async {
      final _repository = ThemeRepository();

      _repository.save("dark");

      expect("dark", await _repository.getTheme());
    });
  });
}
