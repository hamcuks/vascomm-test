import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_test/shared/presentation/widgets/app_button.dart';
import 'package:vascomm_test/shared/presentation/widgets/app_input_form.dart';
import 'package:vascomm_test/shared/styles/colors.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                    'Silahkan register untuk melanjutkan',
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  /// Login Form
                  Form(
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Flexible(
                              child: AppInputForm(
                                title: 'Nama Depan',
                                hintText: 'Masukkan nama depan anda',
                              ),
                            ),
                            SizedBox(width: 16),
                            Flexible(
                              child: AppInputForm(
                                title: 'Nama Belakang',
                                hintText: 'Masukkan nama belakang anda',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        const AppInputForm(
                          title: 'No. KTP',
                          hintText: 'Masukkan no. KTP anda',
                        ),
                        const SizedBox(height: 32),
                        const AppInputForm(
                          title: 'Email',
                          hintText: 'Masukkan email anda',
                        ),
                        const SizedBox(height: 32),
                        const AppInputForm(
                          title: 'Password',
                          hintText: 'Masukkan password anda',
                        ),
                        const SizedBox(height: 32),
                        const AppInputForm(
                          title: 'Konfirmasi Password',
                          hintText: 'Masukkan konfirmasi password anda',
                        ),
                        const SizedBox(height: 32),
                        AppButton(
                          title: 'Register',
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
                        'Sudah punya akun ?',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: kGrey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login sekarang',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

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
                          color: kGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
