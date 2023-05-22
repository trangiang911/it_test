import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo/main.dart' as app;

import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'records sounds and saves it to internal storage',
    nativeAutomation: true,
    ($) async {
      app.main();
      await $.pumpAndSettle();
      await $.native.tap(Selector(text: 'Allow access to manage all files',));
      await $.native.pressBack();
      await $.pumpAndSettle();
      final fabFinder = find.byType(FloatingActionButton);
      await $.tap(fabFinder);
      await $.tap(fabFinder);
      await $.pumpAndSettle();
      final counterFinder = find.text('2');
      expect(counterFinder, findsOneWidget);
    },
  );

  //
  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  //
  // testWidgets('Increment counter', (WidgetTester tester) async {
  //   app.main(); // khởi tạo ứng dụng
  //   await tester.pumpAndSettle(); // chờ cho ứng dụng hiển thị
  //
  //   // tìm floating action button và nhấn vào nó
  //   final fabFinder = find.byType(FloatingActionButton);
  //   expect(fabFinder, findsOneWidget);
  //   await tester.tap(fabFinder);
  //   await tester.tap(fabFinder);
  //   await tester.pumpAndSettle(const Duration(seconds: 10));
  //
  //   // kiểm tra xem giá trị của _counter có tăng lên không
  //   final counterFinder = find.text('2');
  //   expect(counterFinder, findsOneWidget);
  // });
}
