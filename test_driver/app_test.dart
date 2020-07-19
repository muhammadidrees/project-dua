// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Dua App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    SerializableFinder themeSwitch = find.byValueKey("theme_switch");

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    // test("the default app theme is light theme", () async {
    //   expect(materialApp.theme, lightTheme);
    // });

    test(
        'tapping the switch changes theme to dark and than goes back to light on tap',
        () async {
      // First, tap the button.
      await driver.tap(themeSwitch);
    });
  });
}
