import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tanur/main.dart';
import 'package:tanur/jadwal_sholat_page.dart';
import 'package:tanur/al_quran_page.dart';
import 'package:tanur/definisi_umrah_page.dart';
import 'package:tanur/berita_page.dart';
import 'package:tanur/detail_berita_page.dart';

class PhoneFrame extends StatelessWidget {
  final Widget child;
  final bool darkStatusBarIcons;

  const PhoneFrame({
    super.key,
    required this.child,
    this.darkStatusBarIcons = true,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor =
        darkStatusBarIcons ? const Color(0xFF000000) : const Color(0xFFFFFFFF);

    return Container(
      width: 414,
      height: 896,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF101216),
        borderRadius: BorderRadius.circular(54.0),
        border: Border.all(color: const Color(0xFF2C2F36), width: 4.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3D000000),
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(44.0),
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              // Screen content with realistic iPhone safe area padding
              Positioned.fill(
                child: MediaQuery(
                  data: const MediaQueryData(
                    size: Size(390, 844),
                    padding: EdgeInsets.only(top: 52, bottom: 28),
                    viewPadding: EdgeInsets.only(top: 52, bottom: 28),
                  ),
                  child: child,
                ),
              ),

              // Status Bar Top Overlay
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Time
                      Text(
                        '20.37',
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w700,
                          color: statusColor,
                          letterSpacing: -0.2,
                        ),
                      ),

                      // Dynamic Island
                      Container(
                        width: 112,
                        height: 29,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              margin: const EdgeInsets.only(right: 9),
                              decoration: const BoxDecoration(
                                color: Color(0xFF0F172A),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Status icons (Cellular, Wifi, Battery)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Signal bars
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(width: 3, height: 4, color: statusColor),
                              const SizedBox(width: 1.5),
                              Container(width: 3, height: 6.5, color: statusColor),
                              const SizedBox(width: 1.5),
                              Container(width: 3, height: 9, color: statusColor),
                              const SizedBox(width: 1.5),
                              Container(width: 3, height: 11.5, color: statusColor),
                            ],
                          ),
                          const SizedBox(width: 5),
                          Icon(Icons.wifi, size: 15.5, color: statusColor),
                          const SizedBox(width: 5),
                          // Battery icon
                          Container(
                            width: 22,
                            height: 11.5,
                            padding: const EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                              border: Border.all(color: statusColor, width: 1.2),
                              borderRadius: BorderRadius.circular(3.5),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: statusColor,
                                borderRadius: BorderRadius.circular(1.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Home Indicator Bar at the bottom
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 135,
                    height: 4.5,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> precacheAllAssets() async {
  final imageFiles = Directory('assets/images')
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) =>
          f.path.endsWith('.png') ||
          f.path.endsWith('.jpg') ||
          f.path.endsWith('.jpeg'))
      .toList();

  for (final file in imageFiles) {
    final assetPath = file.path.replaceAll('\\', '/');
    try {
      final comp = Completer<void>();
      final stream = AssetImage(assetPath).resolve(ImageConfiguration.empty);
      late ImageStreamListener listener;
      listener = ImageStreamListener((image, synchronousCall) {
        stream.removeListener(listener);
        comp.complete();
      }, onError: (exception, stackTrace) {
        stream.removeListener(listener);
        comp.complete();
      });
      stream.addListener(listener);
      await comp.future;
    } catch (_) {}
  }
}

Future<void> loadAppFonts() async {
  // Load PlusJakartaSans
  final pjsBytes = File('assets/fonts/PlusJakartaSans.ttf').readAsBytesSync();
  final pjsLoader = FontLoader('PlusJakartaSans');
  pjsLoader.addFont(Future.value(ByteData.view(pjsBytes.buffer)));
  await pjsLoader.load();

  // Load as default fallbacks
  final robotoLoader = FontLoader('Roboto');
  robotoLoader.addFont(Future.value(ByteData.view(pjsBytes.buffer)));
  await robotoLoader.load();

  final sfLoader = FontLoader('.SF Pro Text');
  sfLoader.addFont(Future.value(ByteData.view(pjsBytes.buffer)));
  await sfLoader.load();

  // Load Amiri
  if (File('assets/fonts/Amiri-Bold.ttf').existsSync()) {
    final amiriBytes = File('assets/fonts/Amiri-Bold.ttf').readAsBytesSync();
    final amiriLoader = FontLoader('Amiri');
    amiriLoader.addFont(Future.value(ByteData.view(amiriBytes.buffer)));
    await amiriLoader.load();
  }

  // Load Inter
  if (File('assets/fonts/Inter.ttf').existsSync()) {
    final interBytes = File('assets/fonts/Inter.ttf').readAsBytesSync();
    final interLoader = FontLoader('Inter');
    interLoader.addFont(Future.value(ByteData.view(interBytes.buffer)));
    await interLoader.load();
  }

  // Load surah_names
  if (File('assets/fonts/surah_names.ttf').existsSync()) {
    final surahBytes = File('assets/fonts/surah_names.ttf').readAsBytesSync();
    final surahLoader = FontLoader('surah_names');
    surahLoader.addFont(Future.value(ByteData.view(surahBytes.buffer)));
    await surahLoader.load();
  }

  // Load MaterialIcons
  const materialIconPath =
      'C:/flutter/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf';
  if (File(materialIconPath).existsSync()) {
    final iconBytes = File(materialIconPath).readAsBytesSync();
    final iconLoader = FontLoader('MaterialIcons');
    iconLoader.addFont(Future.value(ByteData.view(iconBytes.buffer)));
    await iconLoader.load();
  }
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await loadAppFonts();
  });

  testWidgets('Capture all app screenshots inside smartphone mockup frame',
      (tester) async {
    FlutterError.onError = (details) {
      if (details.exceptionAsString().contains('overflowed')) return;
      FlutterError.dumpErrorToConsole(details);
    };

    // Precache all assets synchronously before rendering
    await tester.runAsync(() async {
      await precacheAllAssets();
    });

    final screens = <String, Map<String, dynamic>>{
      'screenshots/menu_utama.png': {
        'widget': const UmrahMenuPage(),
        'darkStatusBarIcons': true,
      },
      'screenshots/jadwal_sholat.png': {
        'widget': const JadwalSholatPage(),
        'darkStatusBarIcons': false,
      },
      'screenshots/al_quran.png': {
        'widget': const AlQuranPage(),
        'darkStatusBarIcons': true,
      },
      'screenshots/panduan_umrah.png': {
        'widget': const DefinisiUmrahPage(),
        'darkStatusBarIcons': true,
      },
      'screenshots/berita.png': {
        'widget': const BeritaPage(),
        'darkStatusBarIcons': true,
      },
      'screenshots/detail_berita.png': {
        'widget': const DetailBeritaPage(
          title: 'Mengenal Tata Cara Thawaf dan Sa\'i yang Benar Sesuai Sunnah',
          date: '28 OKTOBER 2026',
          imagePath: 'assets/images/berita_detail_banner.png',
        ),
        'darkStatusBarIcons': true,
      },
    };

    const double frameWidth = 414.0;
    const double frameHeight = 896.0;
    const double ratio = 2.0;

    tester.view.physicalSize =
        const Size(frameWidth * ratio, frameHeight * ratio);
    tester.view.devicePixelRatio = ratio;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    for (final entry in screens.entries) {
      final key = GlobalKey();
      final widget = entry.value['widget'] as Widget;
      final darkStatusBarIcons = entry.value['darkStatusBarIcons'] as bool;

      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'PlusJakartaSans',
            fontFamilyFallback: const ['Amiri', 'Inter', 'Roboto'],
            scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            useMaterial3: true,
          ),
          home: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: RepaintBoundary(
                key: key,
                child: PhoneFrame(
                  darkStatusBarIcons: darkStatusBarIcons,
                  child: widget,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pumpAndSettle();

      await tester.runAsync(() async {
        final boundary =
            key.currentContext!.findRenderObject() as RenderRepaintBoundary;
        final image = await boundary.toImage(pixelRatio: ratio);
        final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        final pngBytes = byteData!.buffer.asUint8List();

        final file = File(entry.key);
        await file.parent.create(recursive: true);
        await file.writeAsBytes(pngBytes);
        print('Captured ${entry.key}: ${pngBytes.length} bytes');
      });
    }
  });
}
