import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:demo/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Increment counter', (WidgetTester tester) async {
    app.main(); // khởi tạo ứng dụng
    await tester.pumpAndSettle(); // chờ cho ứng dụng hiển thị

    // tìm floating action button và nhấn vào nó
    final fabFinder = find.byType(FloatingActionButton);
    expect(fabFinder, findsOneWidget);
    await tester.tap(fabFinder);
    await tester.pumpAndSettle(const Duration(seconds: 10));

    // kiểm tra xem giá trị của _counter có tăng lên không
    final counterFinder = find.text('1');
    expect(counterFinder, findsOneWidget);
  });
}
