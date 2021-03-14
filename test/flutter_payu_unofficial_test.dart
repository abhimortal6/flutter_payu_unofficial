import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_payu_unofficial/flutter_payu_unofficial.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_payu_unofficial');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    // expect(await FlutterPayuUnofficial.platformVersion, '42');
  });
}
