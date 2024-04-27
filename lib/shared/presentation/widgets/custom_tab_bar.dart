import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required TabController controller,
    required this.tabs,
  }) : _controller = controller;

  final TabController _controller;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(200),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 16),
            color: const Color(0xFFBEBEBE).withOpacity(0.16),
            blurRadius: 24,
          )
        ],
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: const Color(0xFF00D9D5),
          borderRadius: BorderRadius.circular(200),
        ),
        controller: _controller,
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF002060),
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF002060),
        ),
        dividerColor: Colors.transparent,
        padding: const EdgeInsets.all(4),
        tabs: tabs,
      ),
    );
  }
}
