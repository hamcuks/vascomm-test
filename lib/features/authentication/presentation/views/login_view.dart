import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/images/medical-record-illus.png',
                scale: 3,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                child: Column(
                  children: [
                    AppInputForm(
                      title: 'Email',
                      hintText: 'Masukkan email anda',
                    ),
                    SizedBox(height: 40),
                    AppInputForm(
                      title: 'Password',
                      hintText: 'Masukkan password anda',
                      suffixText: 'Lupa Password anda ?',
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
