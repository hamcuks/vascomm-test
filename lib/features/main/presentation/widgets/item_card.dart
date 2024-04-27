import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 16),
            color: const Color(0xFFBEBEBE).withOpacity(0.16),
            blurRadius: 16,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              const Icon(Icons.star, color: Colors.amber),
              Text(
                '5',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFBEBEBE),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Image.asset('assets/images/microscope.png'),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Suntik Steril',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF200206),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Rp10.000',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFF7200),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFB3FFCB),
                    ),
                    child: Text(
                      'Rp10.000',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF007025),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
