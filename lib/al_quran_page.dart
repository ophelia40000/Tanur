import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'main.dart';

class AlQuranPage extends StatefulWidget {
  const AlQuranPage({super.key});

  @override
  State<AlQuranPage> createState() => _AlQuranPageState();
}

class _AlQuranPageState extends State<AlQuranPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  static const List<Map<String, dynamic>> allSurahs = [
    {
      'number': 1,
      'name': 'Al-Fatihah',
      'meaning': 'Pembukaan - 7 ayat',
      'arabic': 'الفَاتِحَة',
      'calligraphy': 'assets/images/surah_calligraphy/surah_1.png',
    },
    {
      'number': 2,
      'name': 'Al-Baqarah',
      'meaning': 'Sapi - 286 ayat',
      'arabic': 'البَقَرَة',
      'calligraphy': 'assets/images/surah_calligraphy/surah_2.png',
    },
    {
      'number': 3,
      'name': "Ali 'Imran",
      'meaning': 'Keluarga Imran - 200 ayat',
      'arabic': 'آل عِمْرَان',
      'calligraphy': 'assets/images/surah_calligraphy/surah_3.png',
    },
    {
      'number': 4,
      'name': "An-Nisa'",
      'meaning': 'Wanita - 176 ayat',
      'arabic': 'النِّسَاء',
      'calligraphy': 'assets/images/surah_calligraphy/surah_4.png',
    },
    {
      'number': 5,
      'name': "Al-Ma'idah",
      'meaning': 'Hidangan - 120 ayat',
      'arabic': 'المَائِدَة',
      'calligraphy': 'assets/images/surah_calligraphy/surah_5.png',
    },
    {
      'number': 6,
      'name': "Al-An'am",
      'meaning': 'Binatang Ternak - 165 ayat',
      'arabic': 'الأَنْعَام',
      'calligraphy': 'assets/images/surah_calligraphy/surah_6.png',
    },
    {
      'number': 7,
      'name': "Al-A'raf",
      'meaning': 'Tempat Tertinggi - 206 ayat',
      'arabic': 'الأَعْرَاف',
      'calligraphy': 'assets/images/surah_calligraphy/surah_7.png',
    },
    {
      'number': 8,
      'name': 'Al-Anfal',
      'meaning': 'Rampasan Perang - 75 ayat',
      'arabic': 'الأَنْفَال',
      'calligraphy': 'assets/images/surah_calligraphy/surah_8.png',
    },
    {
      'number': 9,
      'name': 'At-Taubah',
      'meaning': 'Pengampunan - 129 ayat',
      'arabic': 'التَّوْبَة',
      'calligraphy': 'assets/images/surah_calligraphy/surah_9.png',
    },
    {
      'number': 10,
      'name': 'Yunus',
      'meaning': 'Yunus - 109 ayat',
      'arabic': 'يُونُس',
      'calligraphy': 'assets/images/surah_calligraphy/surah_10.png',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredSurahs = allSurahs.where((s) {
      final name = (s['name'] as String).toLowerCase();
      final meaning = (s['meaning'] as String).toLowerCase();
      final numStr = s['number'].toString();
      final q = _searchQuery.toLowerCase();
      return name.contains(q) || meaning.contains(q) || numStr.contains(q);
    }).toList();

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
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.pop(context);
                          },
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
                      ),
                      const Text(
                        'Al-Quran',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w900,
                          fontVariations: [FontVariation('wght', 900.0)],
                          color: Color(0xFF0C0910),
                          letterSpacing: -0.4,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Container(
                            height: 98,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF0F2B5C),
                                  Color(0xFF1E3A8A),
                                ],
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/images/quran_banner.png',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const SizedBox.shrink();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDF0F7),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                size: 21,
                                color: Color(0xFF1E293B),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  onChanged: (val) {
                                    setState(() {
                                      _searchQuery = val;
                                    });
                                  },
                                  style: const TextStyle(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1E293B),
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: 'Cari Surat',
                                    hintStyle: TextStyle(
                                      fontSize: 15.5,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF94A3B8),
                                    ),
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      ...List.generate(filteredSurahs.length, (index) {
                        final surah = filteredSurahs[index];
                        final isLast = index == filteredSurahs.length - 1;

                        return Column(
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                splashColor: const Color(0x06000000),
                                highlightColor: const Color(0x03000000),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IslamicNumberBadge(number: surah['number'] as int),
                                      const SizedBox(width: 14),

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              surah['name'] as String,
                                              style: const TextStyle(
                                                fontSize: 16.5,
                                                fontWeight: FontWeight.w900,
                                                fontVariations: [FontVariation('wght', 900.0)],
                                                color: Color(0xFF141414),
                                                letterSpacing: 0.1,
                                              ),
                                            ),
                                            const SizedBox(height: 3),
                                            Text(
                                              surah['meaning'] as String,
                                              style: const TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w800,
                                                fontVariations: [FontVariation('wght', 800.0)],
                                                color: Color(0xFF141414),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Image.asset(
                                        surah['calligraphy'] as String,
                                        height: 28,
                                        fit: BoxFit.contain,
                                        alignment: Alignment.centerRight,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Text(
                                            surah['arabic'] as String,
                                            textDirection: TextDirection.rtl,
                                            style: const TextStyle(
                                              fontFamily: 'Amiri',
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFF0C0910),
                                              height: 1.2,
                                            ),
                                          );
                                        },
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
                                color: Color(0xFFEEEEEE),
                              ),
                          ],
                        );
                      }),

                      const SizedBox(height: 16),
                    ],
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

class IslamicNumberBadge extends StatelessWidget {
  final int number;
  const IslamicNumberBadge({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 38,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/surah_badge.png',
            width: 32,
            height: 38,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => CustomPaint(
              size: const Size(32, 38),
              painter: _IslamicBadgePainter(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.5),
            child: Text(
              '$number',
              style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w800,
                fontVariations: [FontVariation('wght', 800.0)],
                color: Color(0xFF71717A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IslamicBadgePainter extends CustomPainter {
  const _IslamicBadgePainter();

  static const Color strokeColor = Color(0xFFCBD5E1);
  static const double strokeWidth = 1.2;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width * 0.38;
    final leftArcPath = Path();
    leftArcPath.addArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      math.pi * 0.70,
      math.pi * 0.60,
    );
    canvas.drawPath(leftArcPath, paint);

    final rightArcPath = Path();
    rightArcPath.addArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      -math.pi * 0.30,
      math.pi * 0.60, 
    );
    canvas.drawPath(rightArcPath, paint);
    final topCrown = Path();
    final topY = cy - r - 5.5;
    final topEyeY = cy - r - 2.8;
    topCrown.moveTo(cx - r - 1.5, cy - r * 0.25);
    topCrown.lineTo(cx - r + 0.5, cy - r * 0.35);
    topCrown.quadraticBezierTo(cx - r * 0.6, cy - r - 3.0, cx, topY);
    topCrown.quadraticBezierTo(cx + r * 0.6, cy - r - 3.0, cx + r - 0.5, cy - r * 0.35);
    topCrown.lineTo(cx + r + 1.5, cy - r * 0.25);
    topCrown.moveTo(cx - r * 0.8, cy - r * 0.35);
    topCrown.quadraticBezierTo(cx - r * 0.4, cy - r * 0.9, cx, cy - r * 0.8);
    topCrown.quadraticBezierTo(cx + r * 0.4, cy - r * 0.9, cx + r * 0.8, cy - r * 0.35);

    canvas.drawPath(topCrown, paint);
    final topEye = Path();
    topEye.moveTo(cx, topEyeY - 1.6);
    topEye.lineTo(cx + 1.6, topEyeY);
    topEye.lineTo(cx, topEyeY + 1.6);
    topEye.lineTo(cx - 1.6, topEyeY);
    topEye.close();
    canvas.drawPath(topEye, paint);
    final bottomCrown = Path();
    final botY = cy + r + 5.5;
    final botEyeY = cy + r + 2.8;

    bottomCrown.moveTo(cx - r - 1.5, cy + r * 0.25);
    bottomCrown.lineTo(cx - r + 0.5, cy + r * 0.35);
    bottomCrown.quadraticBezierTo(cx - r * 0.6, cy + r + 3.0, cx, botY);
    bottomCrown.quadraticBezierTo(cx + r * 0.6, cy + r + 3.0, cx + r - 0.5, cy + r * 0.35);
    bottomCrown.lineTo(cx + r + 1.5, cy + r * 0.25);

    bottomCrown.moveTo(cx - r * 0.8, cy + r * 0.35);
    bottomCrown.quadraticBezierTo(cx - r * 0.4, cy + r * 0.9, cx, cy + r * 0.8);
    bottomCrown.quadraticBezierTo(cx + r * 0.4, cy + r * 0.9, cx + r * 0.8, cy + r * 0.35);

    canvas.drawPath(bottomCrown, paint);
    final botEye = Path();
    botEye.moveTo(cx, botEyeY - 1.6);
    botEye.lineTo(cx + 1.6, botEyeY);
    botEye.lineTo(cx, botEyeY + 1.6);
    botEye.lineTo(cx - 1.6, botEyeY);
    botEye.close();
    canvas.drawPath(botEye, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

