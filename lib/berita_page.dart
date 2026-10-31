import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'detail_berita_page.dart';

class BeritaPage extends StatefulWidget {
  final bool showBackButton;

  const BeritaPage({
    super.key,
    this.showBackButton = false,
  });

  @override
  State<BeritaPage> createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> with SingleTickerProviderStateMixin {
  late final AnimationController _refreshController;

  static const List<Map<String, String>> newsItems = [
    {
      'date': '05 Juni 2026 06:42',
      'title': 'JANGAN JADI ORANG YANG BANGGA DENGAN DOSANYA SENDIRI',
      'image': 'assets/images/news/news_1.png',
    },
    {
      'date': '17 Juni 2026 07:16',
      'title': 'GELOMBANG KENAIKAN AVTUR: MENGAPA BIAYA HAJI & UMRAH MELAMBUNG',
      'image': 'assets/images/news/news_2.png',
    },
    {
      'date': '17 Juni 2026 07:17',
      'title': 'TENDA DAN PERALATAN HAJI HILANG DALAM SEKEJAP DI MINA',
      'image': 'assets/images/news/news_3.png',
    },
    {
      'date': '17 Juni 2026 07:16',
      'title': 'KALENDER HIJRIAH: PENANGGALAN YANG LAHIR DARI PERISTIWA HIJRAH',
      'image': 'assets/images/news/news_4.png',
    },
    {
      'date': '17 Juni 2026 07:16',
      'title': 'TEDUH DI BAWAH LANGIT MADINAH: ESTETIKA HIJAU KOTA NABI',
      'image': 'assets/images/news/news_5.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _refreshController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _handleRefresh() {
    if (!_refreshController.isAnimating) {
      _refreshController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEEF5),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 414),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                if (widget.showBackButton && Navigator.canPop(context))
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 12.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => Navigator.pop(context),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 18.0,
                            color: Color(0xFF131A37),
                          ),
                        ),
                      ),
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Berita',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 19.0,
                          fontWeight: FontWeight.w900,
                          fontVariations: [FontVariation('wght', 900.0)],
                          color: Color(0xFF131A37),
                          letterSpacing: -0.3,
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: _handleRefresh,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: AnimatedBuilder(
                            animation: _refreshController,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _refreshController.value * 2 * math.pi,
                                child: child,
                              );
                            },
                            child: const Icon(
                              Icons.refresh_rounded,
                              size: 20.0,
                              color: Color(0xFF3B82F6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ...List.generate(newsItems.length, (index) {
                  final item = newsItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 18.0,
                    ),
                    child: Container(
                      height: 98.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0A000000),
                            blurRadius: 10.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16.0),
                          splashColor: const Color(0x06000000),
                          highlightColor: const Color(0x03000000),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailBeritaPage(
                                  date: item['date']!,
                                  title: item['title']!,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16.0, 10.0, 10.0, 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item['date']!,
                                        style: const TextStyle(
                                          fontFamily: 'PlusJakartaSans',
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w800,
                                          fontVariations: [FontVariation('wght', 800.0)],
                                          color: Color(0xFFB78B3F),
                                          letterSpacing: 0.1,
                                        ),
                                      ),
                                      const SizedBox(height: 6.0),
                                      Text(
                                        item['title']!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: 'PlusJakartaSans',
                                          fontSize: 13.8,
                                          fontWeight: FontWeight.w900,
                                          fontVariations: [FontVariation('wght', 900.0)],
                                          color: Color(0xFF131A37),
                                          height: 1.25,
                                          letterSpacing: -0.1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 14.0),

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14.0),
                                  child: Image.asset(
                                    item['image']!,
                                    width: 78.0,
                                    height: 78.0,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 78.0,
                                        height: 78.0,
                                        color: const Color(0xFFE2E8F0),
                                        child: const Icon(
                                          Icons.image_not_supported_outlined,
                                          color: Color(0xFF94A3B8),
                                          size: 28,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),

                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 24.0),
                  child: Center(
                    child: Text(
                      'v1.0.23',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        fontVariations: [FontVariation('wght', 700.0)],
                        color: Color(0xFF7D8592),
                        letterSpacing: 0.2,
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

