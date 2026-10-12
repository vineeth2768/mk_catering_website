import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mk_website/app/app.dart';

void main() {
  testWidgets('MK Catering App desktop smoke test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MkCateringApp());
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(MkCateringApp), findsOneWidget);
  });

  testWidgets('MK Catering App mobile smoke test (390x720)', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 720);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MkCateringApp());
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(MkCateringApp), findsOneWidget);
  });

  testWidgets('MK Catering App small mobile smoke test (360x640)', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MkCateringApp());
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(MkCateringApp), findsOneWidget);
  });

  testWidgets('MK Catering App iPhone SE smoke test (375x667)', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(375, 667);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MkCateringApp());
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(MkCateringApp), findsOneWidget);
  });

  testWidgets('MK Catering App iPhone 14 smoke test (390x844)', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MkCateringApp());
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(MkCateringApp), findsOneWidget);
  });

  testWidgets('MK Catering App tiny screen smoke test (320x568)', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MkCateringApp());
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(MkCateringApp), findsOneWidget);
  });
}
