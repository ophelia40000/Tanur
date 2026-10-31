import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:tanur/main.dart';
import 'package:tanur/detail_berita_page.dart';

void main() {
  testWidgets('Umrah Menu and All Screens Navigation smoke test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(414, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Umrah'), findsOneWidget);
    expect(find.text('DEFINISI UMRAH'), findsOneWidget);

    await tester.tap(find.text('DEFINISI UMRAH'));
    await tester.pumpAndSettle();
    expect(find.text('DEFINISI UMRAH'), findsOneWidget);

    await tester.tap(find.byType(SharpChevron).first);
    await tester.pumpAndSettle();

    await tester.tap(find.textContaining('KEUTAMAAN & FADHILAH'));
    await tester.pumpAndSettle();
    expect(find.text('Jadwal Sholat'), findsOneWidget);

    await tester.tap(find.byType(SharpChevron).first);
    await tester.pumpAndSettle();

    await tester.tap(find.textContaining("DALIL PENSYARI'ATAN"));
    await tester.pumpAndSettle();
    expect(find.text('Al-Quran'), findsWidgets);
    expect(find.text('Cari Surat'), findsOneWidget);
    expect(find.text('Al-Fatihah'), findsOneWidget);
    expect(find.text('Al-Baqarah'), findsOneWidget);

    await tester.tap(find.byType(SharpChevron).first);
    await tester.pumpAndSettle();

    await tester.tap(find.text('FADILLAH UMRAH'));
    await tester.pumpAndSettle();
    expect(find.text('Berita'), findsOneWidget);

    await tester.tap(find.textContaining('JANGAN JADI ORANG'));
    await tester.pumpAndSettle();
    expect(find.textContaining('JANGAN JADI ORANG'), findsOneWidget);
    expect(find.byType(TinyThreeDots), findsOneWidget);
  });
}
