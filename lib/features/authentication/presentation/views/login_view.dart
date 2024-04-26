import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_test/features/authentication/presentation/views/register_view.dart';
import 'package:vascomm_test/shared/presentation/widgets/app_button.dart';
import 'package:vascomm_test/shared/presentation/widgets/app_input_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Greeting Text
                  Row(
                    children: [
                      Text(
                        'Hai, ',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        'Selamat Datang',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Silahkan login untuk melanjutkan',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: const Color(0xFF597393),
                    ),
                  ),
                ],
              ),
            ),

            /// Hero image: Medical record illustration
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/images/medical-record-illus.png',
                scale: 3,
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    /// Login Form
                    Form(
                      child: Column(
                        children: [
                          const AppInputForm(
                            title: 'Email',
                            hintText: 'Masukkan email anda',
                          ),
                          const SizedBox(height: 40),
                          const AppInputForm(
                            title: 'Password',
                            hintText: 'Masukkan password anda',
                            suffixText: 'Lupa Password anda ?',
                            isObscure: true,
                          ),
                          const SizedBox(height: 40),
                          AppButton(
                            title: 'Login',
                            icon: SvgPicture.asset(
                              'assets/icons/chevron-right.svg',
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    /// User auth option(s)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun ?',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xFFBEBEBE),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterView(),
                              ),
                            );
                          },
                          child: Text(
                            'Daftar sekarang',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),

                    /// Copyright text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/copyright-ic.svg'),
                        const SizedBox(width: 4),
                        Text(
                          'SILK. all right reserved.',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color(0xFFBEBEBE),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
