import 'package:flutter_test/flutter_test.dart';
import 'package:animated_bakery/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ProductViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
