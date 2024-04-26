import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInputForm extends StatefulWidget {
  const AppInputForm({
    super.key,
    required this.title,
    this.controller,
    this.hintText,
    this.suffixText,
    this.isObscure,
    this.suffixIcon,
    this.prefixIcon,
  });

  final TextEditingController? controller;
  final String title;
  final String? hintText;
  final String? suffixText;
  final bool? isObscure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  State<AppInputForm> createState() => _AppInputFormState();
}

class _AppInputFormState extends State<AppInputForm> {
  TextEditingController? _controller;

  @override
  void initState() {
    _controller = widget.controller;
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: const Color(0xFF002060),
              ),
            ),
            const Spacer(),
            if (widget.suffixText != null) ...[
              Text(
                widget.suffixText!,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: const Color(0xFF597393),
                ),
              ),
            ]
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 16),
                color: const Color(0xFFBEBEBE).withOpacity(0.16),
                blurRadius: 16,
              )
            ],
          ),
          child: TextFormField(
            controller: _controller,
            obscureText: widget.isObscure ?? false,
            decoration: InputDecoration(
              hintText: widget.hintText,
              // contentPadding:
              //     const EdgeInsets.symmetric(horizontal: 16),
              hintStyle: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
