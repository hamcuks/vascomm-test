import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_test/features/authentication/domain/entities/login_params.dart';
import 'package:vascomm_test/features/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:vascomm_test/features/authentication/presentation/views/register_view.dart';
import 'package:vascomm_test/features/main/presentation/views/home_view.dart';
import 'package:vascomm_test/injector.dart';
import 'package:vascomm_test/shared/presentation/widgets/app_button.dart';
import 'package:vascomm_test/shared/presentation/widgets/app_input_form.dart';
import 'package:vascomm_test/shared/styles/colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                      key: _formKey,
                      child: Column(
                        children: [
                          AppInputForm(
                            controller: _emailController,
                            title: 'Email',
                            hintText: 'Masukkan email anda',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 40),
                          AppInputForm(
                            controller: _passwordController,
                            title: 'Password',
                            hintText: 'Masukkan password anda',
                            suffixText: 'Lupa Password anda ?',
                            isObscure: true,
                          ),
                          const SizedBox(height: 40),
                          BlocConsumer<LoginBloc, LoginState>(
                            listener: (context, state) {
                              switch (state.status) {
                                case LoginStatus.initial:
                                case LoginStatus.loading:
                                  EasyLoading.show(
                                    status: 'Loading',
                                    maskType: EasyLoadingMaskType.black,
                                  );
                                case LoginStatus.success:
                                  EasyLoading.showSuccess(
                                    'Login successfully\n Token: ${state.data}',
                                    maskType: EasyLoadingMaskType.black,
                                  );

                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeView()),
                                      (Route<dynamic> route) => false,
                                    );
                                  });
                                case LoginStatus.failed:
                                  EasyLoading.showError(
                                    state.message!,
                                    maskType: EasyLoadingMaskType.black,
                                  );
                              }
                            },
                            builder: (context, state) {
                              return AppButton(
                                title: 'Login',
                                icon: SvgPicture.asset(
                                  'assets/icons/chevron-right.svg',
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    final data = LoginParams(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    );

                                    sl<LoginBloc>()
                                        .add(LoginEventPressed(data));

                                    return;
                                  }
                                },
                              );
                            },
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
                            color: kGrey,
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
                            color: kGrey,
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
