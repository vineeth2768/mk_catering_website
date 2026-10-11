import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mk_website/app/app.dart';

void main() {
  testWidgets('MK Catering App smoke test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MkCateringApp());
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(MkCateringApp), findsOneWidget);
  });
}
