import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPill extends StatelessWidget {
  const CategoryPill({
    super.key,
    required this.title,
    this.isSelected = false,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF002060) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 16),
            color: const Color(0xFFBEBEBE).withOpacity(0.16),
            blurRadius: 24,
          )
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : const Color(0xFF002060),
          ),
        ),
      ),
    );
  }
}
