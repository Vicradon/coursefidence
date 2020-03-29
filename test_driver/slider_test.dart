import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Coursefindence', () {
    final SerializableFinder sliderFinder = find.byValueKey('slider');
    final SerializableFinder sliderValue = find.byValueKey('slider_value');
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('move the slider', () async {
      await driver.scroll(sliderFinder, 1.0, 0, Duration(milliseconds: 500));
      expect(await driver.getText(sliderValue), "1");
    });
  }); 
}
