import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_test/shared/extensions/string_extension.dart';

class AppInputForm extends StatefulWidget {
  const AppInputForm({
    super.key,
    this.title,
    this.controller,
    this.hintText,
    this.suffixText,
    this.borderRadius = 8,
    this.isRequired = false,
    this.isObscure,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final String? suffixText;
  final double borderRadius;
  final bool isRequired;
  final bool? isObscure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType keyboardType;

  @override
  State<AppInputForm> createState() => _AppInputFormState();
}

class _AppInputFormState extends State<AppInputForm> {
  bool? _isObscure;

  @override
  void initState() {
    _isObscure = widget.isObscure;
    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.dispose();
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
        if (widget.title != null) ...[
          Row(
            children: [
              Text(
                widget.title!,
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
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 16),
                color: const Color(0xFFBEBEBE).withOpacity(0.16),
                blurRadius: 16,
              )
            ],
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText: _isObscure ?? false,
            keyboardType: widget.keyboardType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (!widget.isRequired && (value == null || value.isEmpty)) {
                return 'Field must be filled!';
              }

              if (widget.keyboardType == TextInputType.emailAddress &&
                  value != null &&
                  !value.isEmailValid) {
                return 'Invalid email format!';
              }

              return null;
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              // contentPadding:
              //     const EdgeInsets.symmetric(horizontal: 16),
              hintStyle: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: _getPrefixIcon(_isObscure),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
