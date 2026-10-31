import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tanur/al_quran_page.dart';

void main() {
  testWidgets('AlQuranPage renders surahs, badges, and calligraphy', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AlQuranPage(),
      ),
    );

    expect(find.text('Al-Quran'), findsOneWidget);
    expect(find.text('Cari Surat'), findsOneWidget);

    expect(find.text('Al-Fatihah'), findsOneWidget);
    expect(find.text('Al-Baqarah'), findsOneWidget);
    expect(find.text("Ali 'Imran"), findsOneWidget);

    expect(find.byType(IslamicNumberBadge), findsWidgets);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Baqarah');
    await tester.pump();

    expect(find.text('Al-Baqarah'), findsOneWidget);
    expect(find.text('Al-Fatihah'), findsNothing);
  });
}
