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
  bool? _isObscure;

  @override
  void initState() {
    _controller = widget.controller;
    _isObscure = widget.isObscure;
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Widget? _getPrefixIcon(bool? state) {
    if (widget.prefixIcon != null) return widget.prefixIcon;
    if (state == null) return null;

    return GestureDetector(
      onTap: () {
        _isObscure = !(_isObscure ?? false);
        setState(() {});
      },
      child: state
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
    );
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
            obscureText: _isObscure ?? false,
            decoration: InputDecoration(
              hintText: widget.hintText,
              // contentPadding:
              //     const EdgeInsets.symmetric(horizontal: 16),
              hintStyle: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: widget.prefixIcon,
              suffixIcon: _getPrefixIcon(_isObscure),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
