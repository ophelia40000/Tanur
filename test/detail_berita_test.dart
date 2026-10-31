import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tanur/detail_berita_page.dart';

void main() {
  testWidgets('DetailBeritaPage renders header, image, date, title, and body', (tester) async {
    tester.view.physicalSize = const Size(414, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        home: DetailBeritaPage(),
      ),
    );

    expect(find.text('Berita'), findsOneWidget);
    expect(find.byType(TinyThreeDots), findsOneWidget);

    expect(find.text('05 Juni 2026 06:42'), findsOneWidget);
    expect(
      find.textContaining('JANGAN JADI ORANG'),
      findsOneWidget,
    );

    expect(find.textContaining('Salah satu bentuk kasih sayang Allah'), findsOneWidget);
  });
}

