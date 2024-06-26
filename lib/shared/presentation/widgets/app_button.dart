import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_test/shared/styles/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.width,
    this.height,
    this.icon,
    this.backgroundColor,
    this.borderRadius,
    this.onPressed,
  });

  final double? width;
  final double? height;
  final String title;
  final Widget? icon;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      width: width ?? double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? kTitle,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: AutoSizeText(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}
