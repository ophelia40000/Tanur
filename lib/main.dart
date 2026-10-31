import 'package:flutter/material.dart';
import 'definisi_umrah_page.dart';
import 'jadwal_sholat_page.dart';
import 'al_quran_page.dart';
import 'berita_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Umrah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        useMaterial3: true,
      ),
      home: const UmrahMenuPage(),
    );
  }
}

class UmrahMenuPage extends StatelessWidget {
  const UmrahMenuPage({super.key});

  static const List<String> menuItems = [
    'DEFINISI UMRAH',
    'KEUTAMAAN & FADHILAH\nUMRAH',
    "DALIL PENSYARI'ATAN UMRAH",
    'FADILLAH UMRAH',
    'JENIS UMRAH',
    'RUKUN UMRAH',
    'BERUMRAH SEBELUM BERHAJI',
    "TEMPAT-TEMPAT DIJABAH\nDO'A",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 414),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
                              child: SharpChevron(
                                direction: ChevronDirection.left,
                                width: 9.0,
                                height: 16.0,
                                strokeWidth: 2.8,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                          const SizedBox(width: 18),
                          Transform.translate(
                            offset: const Offset(0, 5.0),
                            child: const IosMosqueIcon(size: 40),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Umrah',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                              fontVariations: [FontVariation('wght', 900.0)],
                              color: Color(0xFF000000),
                              letterSpacing: -0.5,
                            ),
                          ),
                          
                        ],
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                          child: ThreeDotsIcon(),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 26),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEFEFE),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: const Color(0xFFEBEBEB),
                          width: 1.0,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(menuItems.length, (index) {
                          final title = menuItems[index];
                          final isLast = index == menuItems.length - 1;

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    if (index == 0) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const DefinisiUmrahPage(),
                                        ),
                                      );
                                    } else if (index == 1) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const JadwalSholatPage(),
                                        ),
                                      );
                                    } else if (index == 2) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const AlQuranPage(),
                                        ),
                                      );
                                    } else if (index == 3) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const BeritaPage(showBackButton: true),
                                        ),
                                      );
                                    }
                                  },
                                  splashColor: const Color(0x06000000),
                                  highlightColor: const Color(0x03000000),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 22.0,
                                      right: 32.0,
                                      top: 15.0,
                                      bottom: 15.0,
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            title,
                                            style: const TextStyle(
                                              fontSize: 15.5,
                                              fontWeight: FontWeight.w900,
                                              fontVariations: [FontVariation('wght', 900.0)],
                                              color: Color(0xFF0C0910),
                                              letterSpacing: 1.0,
                                              height: 1.25,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        const SharpChevron(
                                          direction: ChevronDirection.right,
                                          width: 7.5,
                                          height: 13.0,
                                          strokeWidth: 2.8,
                                          color: Color(0xFF2C2C32),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (!isLast)
                                const Divider(
                                  height: 1.0,
                                  thickness: 1.0,
                                  color: Color(0xFFEBEBEB),
                                ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum ChevronDirection { left, right }

class SharpChevron extends StatelessWidget {
  final ChevronDirection direction;
  final double width;
  final double height;
  final double strokeWidth;
  final Color color;

  const SharpChevron({
    super.key,
    required this.direction,
    this.width = 7.5,
    this.height = 13.0,
    this.strokeWidth = 2.6,
    this.color = const Color(0xFF2C2C32),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _SharpChevronPainter(
        direction: direction,
        strokeWidth: strokeWidth,
        color: color,
      ),
    );
  }
}

class _SharpChevronPainter extends CustomPainter {
  final ChevronDirection direction;
  final double strokeWidth;
  final Color color;

  _SharpChevronPainter({
    required this.direction,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square
      ..strokeJoin = StrokeJoin.miter;

    final path = Path();
    if (direction == ChevronDirection.right) {
      path.moveTo(0, 0);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(0, size.height);
    } else {
      path.moveTo(size.width, 0);
      path.lineTo(0, size.height / 2);
      path.lineTo(size.width, size.height);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _SharpChevronPainter oldDelegate) =>
      oldDelegate.direction != direction ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.color != color;
}

class IosMosqueIcon extends StatelessWidget {
  final double size;
  const IosMosqueIcon({super.key, this.size = 25});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/mosque.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return CustomPaint(
          size: Size(size, size),
          painter: _MosqueVectorPainter(),
        );
      },
    );
  }
}

class _MosqueVectorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 26.0;
    canvas.save();
    canvas.scale(scale, scale);

    final domePaint = Paint()
      ..color = const Color(0xFF26B5A6)
      ..style = PaintingStyle.fill;

    final domeHighlight = Paint()
      ..color = const Color(0xFF65E4D4)
      ..style = PaintingStyle.fill;

    final basePaint = Paint()
      ..color = const Color(0xFF326B7D)
      ..style = PaintingStyle.fill;

    final doorPaint = Paint()
      ..color = const Color(0xFFFFF2D0)
      ..style = PaintingStyle.fill;

    final domePath = Path()
      ..moveTo(2, 14)
      ..cubicTo(2, 8, 5, 4, 9.5, 1.5)
      ..cubicTo(14, 4, 17, 8, 17, 14)
      ..close();
    canvas.drawPath(domePath, domePaint);

    final hlPath = Path()
      ..moveTo(3.5, 12)
      ..cubicTo(3.5, 8, 6, 5, 9, 3)
      ..cubicTo(6.5, 5, 5, 8, 5, 12)
      ..close();
    canvas.drawPath(hlPath, domeHighlight);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(2, 14, 15, 10),
        const Radius.circular(1.5),
      ),
      basePaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        const Rect.fromLTWH(4, 17, 2.8, 7),
        topLeft: const Radius.circular(1.4),
        topRight: const Radius.circular(1.4),
      ),
      doorPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        const Rect.fromLTWH(8.1, 15.5, 2.8, 8.5),
        topLeft: const Radius.circular(1.4),
        topRight: const Radius.circular(1.4),
      ),
      doorPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        const Rect.fromLTWH(12.2, 17, 2.8, 7),
        topLeft: const Radius.circular(1.4),
        topRight: const Radius.circular(1.4),
      ),
      doorPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(19.5, 7, 4.5, 17),
        const Radius.circular(1),
      ),
      basePaint,
    );

    final minaretDomePath = Path()
      ..moveTo(19.5, 7)
      ..cubicTo(19.5, 4, 21.75, 1.5, 21.75, 1.5)
      ..cubicTo(21.75, 1.5, 24, 4, 24, 7)
      ..close();
    canvas.drawPath(minaretDomePath, domePaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ThreeDotsIcon extends StatelessWidget {
  final Color color;
  const ThreeDotsIcon({super.key, this.color = const Color(0xFF000000)});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _dot(),
        const SizedBox(width: 3.5),
        _dot(),
        const SizedBox(width: 3.5),
        _dot(),
      ],
    );
  }

  Widget _dot() {
    return Container(
      width: 4.5,
      height: 4.5,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}


