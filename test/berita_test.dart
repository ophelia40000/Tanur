import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tanur/berita_page.dart';

void main() {
  testWidgets('BeritaPage renders header, refresh icon, 5 news items, and version', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: BeritaPage(),
      ),
    );

    expect(find.text('Berita'), findsOneWidget);
    expect(find.byIcon(Icons.refresh_rounded), findsOneWidget);

    await tester.tap(find.byIcon(Icons.refresh_rounded));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pumpAndSettle();

    expect(find.text('05 Juni 2026 06:42'), findsOneWidget);
    expect(find.textContaining('JANGAN JADI ORANG'), findsOneWidget);

    expect(find.text('17 Juni 2026 07:16'), findsNWidgets(3));
    expect(find.textContaining('GELOMBANG KENAIKAN AVTUR'), findsOneWidget);
    expect(find.textContaining('TENDA DAN PERALATAN HAJI'), findsOneWidget);
    expect(find.textContaining('KALENDER HIJRIAH'), findsOneWidget);
    expect(find.textContaining('TEDUH DI BAWAH LANGIT MADINAH'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('v1.0.23'),
      300.0,
      scrollable: find.byType(Scrollable),
    );
    expect(find.text('v1.0.23'), findsOneWidget);
  });
}
