import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_test/features/authentication/presentation/views/login_view.dart';
import 'package:vascomm_test/features/profile/presentation/views/profile_view.dart';
import 'package:vascomm_test/shared/presentation/widgets/app_button.dart';
import 'package:vascomm_test/shared/styles/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.close),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Angga Praja',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kTitle,
                          ),
                        ),
                        Text(
                          'Membership BBLK',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: kTitle.withOpacity(.55),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  child: Column(
                    children: [
                      _DrawerItemLink(
                        title: 'Profil Saya',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileView(),
                          ),
                        ),
                      ),
                      const _DrawerItemLink(title: 'Pengaturan'),
                      const SizedBox(height: 40),
                      AppButton(
                        title: 'Keluar',
                        height: 32,
                        backgroundColor: Colors.red,
                        borderRadius: BorderRadius.circular(200),
                        onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                          (Route<dynamic> route) => false,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 64),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ikuti kami di',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: kTitle,
                      ),
                    ),
                    const SizedBox(width: 16),
                    SvgPicture.asset('assets/icons/facebook-ic.svg'),
                    const SizedBox(width: 8),
                    SvgPicture.asset('assets/icons/instagram-ic.svg'),
                    const SizedBox(width: 8),
                    SvgPicture.asset('assets/icons/twitter-ic.svg'),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FAQ',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: kGrey,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Terms and Conditions',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: kGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItemLink extends StatelessWidget {
  const _DrawerItemLink({
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: kTitle.withOpacity(.55),
            ),
          ),
          const SizedBox(width: 12),
          Icon(
            Icons.chevron_right,
            color: kTitle.withOpacity(.55),
          )
        ],
      ),
    );
  }
}
