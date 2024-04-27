import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_test/features/main/presentation/widgets/item_card.dart';
import 'package:vascomm_test/shared/presentation/widgets/app_button.dart';
import 'package:vascomm_test/shared/presentation/widgets/app_input_form.dart';
import 'package:vascomm_test/shared/presentation/widgets/notification_banner.dart';

import '../widgets/category_pill.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/dash-menu-ic.svg'),
                  const Spacer(),
                  SvgPicture.asset('assets/icons/cart-ic.svg'),
                  const SizedBox(width: 32),
                  SvgPicture.asset('assets/icons/notif-new-ic.svg'),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        const _MedicalSolutionCard(),
                        const SizedBox(height: 40),
                        const _CovidSpecialServiceCard(),
                        const SizedBox(height: 40),
                        const _MedicalTrackCard(),
                        const SizedBox(height: 40),
                        const _HomeItemSearch(),
                        const SizedBox(height: 40),
                        _CategorySlider(),
                        const SizedBox(height: 40),
                        const _ItemListSlider(),
                      ],
                    ),
                  ),
                  const NotificationBanner()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategorySlider extends StatelessWidget {
  _CategorySlider();

  final dummy = [
    {'title': 'All Products', 'isSelected': true},
    {'title': 'Layanan Kesehatan', 'isSelected': false},
    {'title': 'Alat Kesehatan', 'isSelected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dummy.length,
        clipBehavior: Clip.none,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final data = dummy[index];

          return CategoryPill(
            title: data['title'].toString(),
            isSelected: bool.parse(data['isSelected'].toString()),
          );
        },
      ),
    );
  }
}

class _ItemListSlider extends StatelessWidget {
  const _ItemListSlider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        clipBehavior: Clip.none,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return const ItemCard();
        },
      ),
    );
  }
}

class _HomeItemSearch extends StatelessWidget {
  const _HomeItemSearch();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Center(child: Icon(Icons.tune_rounded)),
        ),
        const SizedBox(width: 16),
        const Flexible(
          child: AppInputForm(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            borderRadius: 30,
          ),
        ),
      ],
    );
  }
}

class _MedicalTrackCard extends StatelessWidget {
  const _MedicalTrackCard();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 16),
                color: const Color(0xFFBEBEBE).withOpacity(0.16),
                blurRadius: 24,
              )
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 120),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Track Pemeriksaan',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Kamu dapat mengecek progress pemeriksaanmu disini',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0xFF597393),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          'Track',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          'assets/icons/chevron-right.svg',
                          color: Colors.black,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Image.asset(
            'assets/images/key-illus.png',
            width: 100,
          ),
        ),
      ],
    );
  }
}

class _CovidSpecialServiceCard extends StatelessWidget {
  const _CovidSpecialServiceCard();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 16),
                color: const Color(0xFFBEBEBE).withOpacity(0.16),
                blurRadius: 24,
              )
            ],
          ),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Layanan Khusus',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tes Covid 19, Cegah Corona Sedini Mungkin',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0xFF597393),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          'Kesehatan Anda',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          'assets/icons/chevron-right.svg',
                          color: Colors.black,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 64),
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: -20,
          child: Image.asset(
            'assets/images/vaccine-illus.png',
            width: 100,
          ),
        ),
      ],
    );
  }
}

class _MedicalSolutionCard extends StatelessWidget {
  const _MedicalSolutionCard();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
                Color(0xFFDAE9F9),
              ],
              stops: [0, 0.6, 1],
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 16),
                color: const Color(0xFF002060).withOpacity(0.24),
                blurRadius: 24,
              )
            ],
          ),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Solusi, ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Kesehatan Anda',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Update informasi seputar kesehatan semua bisa disini !',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0xFF597393),
                      ),
                    ),
                    const SizedBox(height: 12),
                    AppButton(
                      width: 200,
                      height: 32,
                      title: 'Selengkapnya',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 64),
            ],
          ),
        ),
        Positioned(
          right: -10,
          top: -20,
          child: Image.asset(
            'assets/images/calendar-illus.png',
            width: 128,
          ),
        ),
      ],
    );
  }
}
