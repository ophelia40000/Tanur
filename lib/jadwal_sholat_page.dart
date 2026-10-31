import 'package:flutter/material.dart';
import 'main.dart';

class JadwalSholatPage extends StatelessWidget {
  const JadwalSholatPage({super.key});

  static const List<Map<String, dynamic>> prayerSchedule = [
    {
      'name': 'Subuh',
      'time': '04:08',
      'type': 'speaker',
    },
    {
      'name': 'Terbit',
      'time': '05:28',
      'type': 'disabled',
    },
    {
      'name': 'Dzuhur',
      'time': '11:37',
      'type': 'bell',
    },
    {
      'name': 'Ashar',
      'time': '14:51',
      'type': 'bell',
    },
    {
      'name': 'Maghrib',
      'time': '17:46',
      'type': 'speaker',
    },
    {
      'name': 'Isya',
      'time': '18:58',
      'type': 'bell',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 414),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF2661C0),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(44.0),
                                  bottomRight: Radius.circular(44.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 22.0),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF256BAC),
                                  Color(0xFF225EA4),
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(28.0),
                                bottomRight: Radius.circular(28.0),
                              ),
                            ),
                            child: SafeArea(
                              bottom: false,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 12.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GestureDetector(
                                              behavior: HitTestBehavior.opaque,
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
                                                child: SharpChevron(
                                                  direction: ChevronDirection.left,
                                                  width: 8.5,
                                                  height: 15.0,
                                                  strokeWidth: 2.8,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 14),
                                            const Text(
                                              'Jadwal Sholat',
                                              style: TextStyle(
                                                fontSize: 21,
                                                fontWeight: FontWeight.w900,
                                                fontVariations: [FontVariation('wght', 900.0)],
                                                color: Colors.white,
                                                letterSpacing: -0.4,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GestureDetector(
                                              behavior: HitTestBehavior.opaque,
                                              onTap: () {},
                                              child: const Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Icon(
                                                  Icons.info_outline,
                                                  color: Colors.white,
                                                  size: 21,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            GestureDetector(
                                              behavior: HitTestBehavior.opaque,
                                              onTap: () {},
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                                                child: ThreeDotsIcon(color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 20.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 142,
                                          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(22.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                'Subuh',
                                                style: TextStyle(
                                                  fontSize: 16.5,
                                                  fontWeight: FontWeight.w900,
                                                  fontVariations: [FontVariation('wght', 900.0)],
                                                  color: Color(0xFF141414),
                                                ),
                                              ),
                                              const SizedBox(height: 2),
                                              const Text(
                                                '04:07',
                                                style: TextStyle(
                                                  fontSize: 34.0,
                                                  fontWeight: FontWeight.w900,
                                                  fontVariations: [FontVariation('wght', 900.0)],
                                                  color: Color(0xFF3897F0),
                                                  letterSpacing: -0.8,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              RichText(
                                                text: const TextSpan(
                                                  style: TextStyle(
                                                    fontFamily: 'PlusJakartaSans',
                                                    fontSize: 13.5,
                                                    fontWeight: FontWeight.w900,
                                                    fontVariations: [FontVariation('wght', 900.0)],
                                                    color: Color(0xFF141414),
                                                    letterSpacing: 0.3,
                                                  ),
                                                  children: [
                                                    TextSpan(text: '07'),
                                                    TextSpan(
                                                      text: ' : ',
                                                      style: TextStyle(
                                                        color: Color(0xFF9CA3AF),
                                                        fontWeight: FontWeight.w800,
                                                      ),
                                                    ),
                                                    TextSpan(text: '29'),
                                                    TextSpan(
                                                      text: ' : ',
                                                      style: TextStyle(
                                                        color: Color(0xFF9CA3AF),
                                                        fontWeight: FontWeight.w800,
                                                      ),
                                                    ),
                                                    TextSpan(text: '42'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: const [
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 2.0),
                                                    child: YellowPinIcon(),
                                                  ),
                                                  SizedBox(width: 7),
                                                  Expanded(
                                                    child: Text(
                                                      'Cengkareng, Kota\nJakarta Barat',
                                                      style: TextStyle(
                                                        fontSize: 14.5,
                                                        fontWeight: FontWeight.w900,
                                                        fontVariations: [FontVariation('wght', 900.0)],
                                                        color: Colors.white,
                                                        height: 1.22,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              const SizedBox(height: 16),
                                              GestureDetector(
                                                behavior: HitTestBehavior.opaque,
                                                onTap: () {},
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.5),
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFFEA4326),
                                                    borderRadius: BorderRadius.circular(100),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: const [
                                                      Text(
                                                        'Arah Kiblat',
                                                        style: TextStyle(
                                                          fontSize: 13.5,
                                                          fontWeight: FontWeight.w900,
                                                          fontVariations: [FontVariation('wght', 900.0)],
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(width: 6),
                                                      SharpChevron(
                                                        direction: ChevronDirection.right,
                                                        width: 5.5,
                                                        height: 10.0,
                                                        strokeWidth: 2.2,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 18.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(color: const Color(0xFFEBEBEB), width: 1.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: SharpChevron(
                                    direction: ChevronDirection.left,
                                    width: 6.5,
                                    height: 12.0,
                                    strokeWidth: 2.4,
                                    color: Color(0xFF2C2C32),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    '29 Okt 2026',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w900,
                                      fontVariations: [FontVariation('wght', 900.0)],
                                      color: Color(0xFF141414),
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '18 Jumadil Awal 1448 H',
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w800,
                                      fontVariations: [FontVariation('wght', 800.0)],
                                      color: Color(0xFF141414),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: SharpChevron(
                                    direction: ChevronDirection.right,
                                    width: 6.5,
                                    height: 12.0,
                                    strokeWidth: 2.4,
                                    color: Color(0xFF2C2C32),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(color: const Color(0xFFEBEBEB), width: 1.0),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(prayerSchedule.length, (index) {
                              final item = prayerSchedule[index];
                              final isLast = index == prayerSchedule.length - 1;
                              final type = item['type'] as String;

                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
                                    child: Row(
                                      children: [
                                        _prayerIcon(type),
                                        const SizedBox(width: 18),
                                        Expanded(
                                          child: Text(
                                            item['name'],
                                            style: const TextStyle(
                                              fontSize: 16.5,
                                              fontWeight: FontWeight.w900,
                                              fontVariations: [FontVariation('wght', 900.0)],
                                              color: Color(0xFF141414),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          item['time'],
                                          style: const TextStyle(
                                            fontSize: 17.5,
                                            fontWeight: FontWeight.w900,
                                            fontVariations: [FontVariation('wght', 900.0)],
                                            color: Color(0xFF141414),
                                            letterSpacing: 0.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (!isLast)
                                    const Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      color: Color(0xFFEEEEEE),
                                    ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.info_outline,
                              size: 16.5,
                              color: Color(0xFF141414),
                            ),
                            const SizedBox(width: 6),
                            const Expanded(
                              child: Text(
                                'Perhitungan waktu sholat',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w900,
                                  fontVariations: [FontVariation('wght', 900.0)],
                                  color: Color(0xFF141414),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'INFO',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w900,
                                  fontVariations: [FontVariation('wght', 900.0)],
                                  color: Color(0xFF22C55E),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _prayerIcon(String type) {
    if (type == 'speaker') {
      return const Icon(
        Icons.volume_up_outlined,
        color: Color(0xFF22C55E),
        size: 22,
      );
    } else if (type == 'disabled') {
      return const Icon(
        Icons.do_not_disturb_alt_outlined,
        color: Color(0xFF9CA3AF),
        size: 22,
      );
    } else {
      return const Icon(
        Icons.notifications_none_outlined,
        color: Color(0xFF22C55E),
        size: 22,
      );
    }
  }
}

class YellowPinIcon extends StatelessWidget {
  const YellowPinIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(18, 22),
      painter: _YellowPinPainter(),
    );
  }
}

class _YellowPinPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 18.0;
    canvas.save();
    canvas.scale(scale, scale);

    final strokePaint = Paint()
      ..color = const Color(0xFFFACC15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final dotPaint = Paint()
      ..color = const Color(0xFFFACC15)
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(9, 21)
      ..cubicTo(5.5, 16.5, 2, 12.5, 2, 8.5)
      ..cubicTo(2, 4.3, 5.1, 1.5, 9, 1.5)
      ..cubicTo(12.9, 1.5, 16, 4.3, 16, 8.5)
      ..cubicTo(16, 12.5, 12.5, 16.5, 9, 21)
      ..close();

    canvas.drawPath(path, strokePaint);
    canvas.drawCircle(const Offset(9, 8.5), 2.2, dotPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
