import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_gallery/app.dart';
import 'package:widget_gallery/core/di/service_locator.dart';
import 'package:widget_gallery/domain/entities/app_language.dart';
import 'package:widget_gallery/domain/entities/color_flavor.dart';

void main() {
  final sl = ServiceLocator.instance;

  group('Domain/data wiring', () {
    test('repository exposes widgets and categories via use cases', () {
      final vm = sl.createGalleryHomeViewModel();
      expect(vm.totalCount, greaterThan(10));
      expect(vm.visibleCategories, contains('Buttons'));
      expect(vm.widgetsIn('Buttons'), isNotEmpty);
    });

    test('search filters widgets and categories', () {
      final vm = sl.createGalleryHomeViewModel();
      vm.search('avatar');
      expect(vm.hasResults, isTrue);
      expect(
        vm.visibleCategories.every((c) => vm.widgetsIn(c).isNotEmpty),
        isTrue,
      );
      vm.search('zzzzz-no-match');
      expect(vm.hasResults, isFalse);
    });

    test('settings entities expose flavors and languages', () {
      expect(ColorFlavor.values.length, greaterThanOrEqualTo(5));
      expect(AppLanguage.fromCode('bn'), AppLanguage.bengali);
      expect(AppLanguage.fromCode('xx'), AppLanguage.english);
    });
  });

  group('Widget', () {
    testWidgets('home renders title and a category', (tester) async {
      await tester.pumpWidget(const WidgetGalleryApp());

      expect(find.text('Widget Gallery'), findsWidgets);
      expect(find.text('Buttons'), findsOneWidget);
    });

    testWidgets('tapping a widget opens the detail view', (tester) async {
      await tester.pumpWidget(const WidgetGalleryApp());

      await tester.tap(find.text('AppButton').first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 800));

      expect(find.text('Preview'), findsOneWidget);
      expect(find.text('Source code'), findsOneWidget);
    });

    testWidgets('switching language localizes the UI', (tester) async {
      await tester.pumpWidget(const WidgetGalleryApp());
      expect(find.text('Widget Gallery'), findsWidgets);

      await tester.tap(find.byIcon(Icons.tune_rounded));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      await tester.tap(find.text('বাংলা'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 700));

      expect(find.text('উইজেট গ্যালারি'), findsWidgets);
    });
  });
}
