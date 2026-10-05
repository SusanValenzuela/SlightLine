import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sightline/main.dart';

void main() {
  testWidgets('starter clearly marks description capture as unavailable',
      (tester) async {
    await tester.pumpWidget(const SightLineApp());
    expect(find.text('Welcome to SightLine'), findsOneWidget);
    final button = tester.widget<FilledButton>(find.byType(FilledButton));
    expect(button.onPressed, isNull);
  });
}
