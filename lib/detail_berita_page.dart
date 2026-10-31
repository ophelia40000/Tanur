import 'package:flutter/material.dart';
import 'main.dart';

class DetailBeritaPage extends StatelessWidget {
  final String date;
  final String title;
  final String imagePath;
  final String content;

  const DetailBeritaPage({
    super.key,
    this.date = '05 Juni 2026 06:42',
    this.title = 'JANGAN JADI ORANG\nYANG BANGGA DENGAN\nDOSANYA SENDIRI',
    this.imagePath = 'assets/images/berita_detail_banner.png',
    this.content =
        'Salah satu bentuk kasih sayang Allah kepada hamba-Nya adalah menutupi aib dan dosa yang dilakukan secara diam-diam. Betapa banyak manusia yang bermaksiat, tetapi Allah masih menjaga kehormatannya di hadapan orang lain. Namun ada sebagian orang yang justru membuka sendiri dosa yang sudah Allah tutupi. Mereka menceritakan maksiatnya dengan bangga, menjadikannya candaan, bahkan mengunggahnya ke media sosial seolah itu sesuatu yang biasa. Padahal dalam Islam, perbuatan seperti ini disebut mujaharah, yaitu bermaksiat secara terang-terangan dan tanpa rasa malu.\n\n'
        'Rasulullah shallallahu \'alaihi wa sallam bersabda:\n'
        '"Setiap umatku dimaafkan kecuali orang yang bermujaharah (terang-terangan dalam bermaksiat)..." (HR. Bukhari dan Muslim).\n\n'
        'Ketika seseorang dengan bangga menceritakan dosanya, ia telah kehilangan rasa takut kepada Allah dan rasa malu terhadap sesama manusia. Padahal rasa malu adalah bagian dari keimanan yang menjaga seorang hamba agar senantiasa berada dalam ketaatan.',
  });

  @override
  Widget build(BuildContext context) {
    // Standardize title into 3 lines if passed as single-line string
    final formattedTitle = title.contains('\n')
        ? title
        : title.replaceAll(
            'JANGAN JADI ORANG YANG BANGGA DENGAN DOSANYA SENDIRI',
            'JANGAN JADI ORANG\nYANG BANGGA DENGAN\nDOSANYA SENDIRI',
          );

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 12.0),
              child: Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                      child: SharpChevron(
                        direction: ChevronDirection.left,
                        width: 8.5,
                        height: 16.0,
                        strokeWidth: 2.8,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'Berita',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                      fontVariations: [FontVariation('wght', 900.0)],
                      color: Color(0xFF0C0910),
                      letterSpacing: -0.3,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
                      child: TinyThreeDots(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  AspectRatio(
                    aspectRatio: 472 / 316,
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFF1E293B),
                          child: const Center(
                            child: Icon(Icons.image, color: Colors.white54, size: 48),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 18),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          date,
                          style: const TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 13.5,
                            fontWeight: FontWeight.w800,
                            fontVariations: [FontVariation('wght', 800.0)],
                            color: Color(0xFF131A37),
                            letterSpacing: 0.1,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          formattedTitle,
                          style: const TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                            fontVariations: [FontVariation('wght', 900.0)],
                            color: Color(0xFF131A37),
                            height: 1.25,
                            letterSpacing: -0.2,
                          ),
                        ),
                        const SizedBox(height: 16),

                        Text(
                          content,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 14.5,
                            fontWeight: FontWeight.w600,
                            fontVariations: [FontVariation('wght', 600.0)],
                            color: Color(0xFF131A37),
                            height: 1.6,
                            letterSpacing: 0.1,
                          ),
                        ),

                        const SizedBox(height: 36),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TinyThreeDots extends StatelessWidget {
  final Color color;

  const TinyThreeDots({
    super.key,
    this.color = const Color(0xFF000000),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _dot(),
        const SizedBox(width: 3.0),
        _dot(),
        const SizedBox(width: 3.0),
        _dot(),
      ],
    );
  }

  Widget _dot() {
    return Container(
      width: 3.5,
      height: 3.5,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
