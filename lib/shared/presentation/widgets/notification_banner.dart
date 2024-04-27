import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationBanner extends StatelessWidget {
  const NotificationBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: const Color(0xFF002060),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned(
            left: -80,
            bottom: -80,
            child: Container(
              width: 228,
              height: 228,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 50,
                  color: Colors.white.withOpacity(.1),
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 100,
            top: 10,
            child: SvgPicture.asset('assets/images/dot-background.svg'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
            child: Row(
              children: [
                Text(
                  'Ingin mendapat update \ndari kami ?',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'Dapatkan \nnotifikasi',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset('assets/icons/chevron-right.svg'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
