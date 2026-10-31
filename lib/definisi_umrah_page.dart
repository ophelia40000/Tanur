import 'package:flutter/material.dart';
import 'main.dart';

class DefinisiUmrahPage extends StatelessWidget {
  const DefinisiUmrahPage({super.key});

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

                const SizedBox(height: 22),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'DEFINISI UMRAH',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            fontVariations: [FontVariation('wght', 900.0)],
                            color: Color(0xFF0C0910),
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          "Menurut bahasa, umrah (\u2020) berarti ziarah atau berkunjung. Adapun pengertian umrah menurut syariat adalah berziarah ke Baitullah dengan berthawaf (mengelilingi Ka'bah 7 kali), mengerjakan sa'i di antara bukit Shafa dan bukit Marwah, serta mencukur atau memendekkan rambut kepala.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF141414),
                            height: 1.48,
                            letterSpacing: 0.1,
                          ),
                        ),

                        const SizedBox(height: 26),

                        const Text(
                          "DALIL PENSYARI'ATAN UMRAH",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            fontVariations: [FontVariation('wght', 900.0)],
                            color: Color(0xFF0C0910),
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'a. Allah berfirman:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF141414),
                            height: 1.35,
                          ),
                        ),

                        const SizedBox(height: 14),

                        const Text(
                          'وَأَتِمُّوا الْحَجَّ وَالْعُمْرَةَ لِلَّهِ',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0C0910),
                            height: 1.8,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Wa atimmul hajja wal 'umrota lillah",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF141414),
                            height: 1.35,
                          ),
                        ),

                        const SizedBox(height: 4),

                        const Text(
                          '"Dan sempurnakanlah ibadah haji dan\numrah karena Allah',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF141414),
                            height: 1.38,
                          ),
                        ),

                        const SizedBox(height: 4),

                        const Text(
                          '(QS. Al-Baqarah 2: 196)',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF141414),
                            height: 1.35,
                          ),
                        ),

                        const SizedBox(height: 26),

                        const Text(
                          'Rasulullah Semasa Mengerjakan Umrah Empat Kali. Imam Ibnu Katsir mengatakan: "Diriwayatkan secara shahih bahwa Nabi melaksanakan umrah sebanyak empat kali. Semuanya beliau kerjakan pada bulan Dzulqa\'dah, yaitu: Pertama, umrah Hudaibiyyah pada bulan Dzulqa\'dah tahun 6 H. Kedua, umratul Qadha\' pada bulan Dzulqa\'dah tahun 7 H. Ketiga, umrah Ji\'rânah pada bulan Dzulqa\'dah tahun 8 H. Keempat, umrah bersama haji beliau (haji wada\')."',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF141414),
                            height: 1.48,
                            letterSpacing: 0.1,
                          ),
                        ),

                        const SizedBox(height: 24),
                      ],
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

