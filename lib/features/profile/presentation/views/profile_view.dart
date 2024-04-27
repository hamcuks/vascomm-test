import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_test/shared/presentation/widgets/app_button.dart';
import 'package:vascomm_test/shared/presentation/widgets/app_drawer.dart';
import 'package:vascomm_test/shared/presentation/widgets/app_input_form.dart';
import 'package:vascomm_test/shared/presentation/widgets/custom_tab_bar.dart';
import 'package:vascomm_test/shared/presentation/widgets/notification_banner.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late final TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              _key.currentState?.openEndDrawer();
            },
            child: SvgPicture.asset(
              'assets/icons/dash-menu-ic.svg',
              height: 16,
              width: 16,
              fit: BoxFit.scaleDown,
            ),
          ),
          actions: [
            SvgPicture.asset('assets/icons/cart-ic.svg'),
            const SizedBox(width: 32),
            SvgPicture.asset('assets/icons/notif-new-ic.svg'),
            const SizedBox(width: 16),
          ],
        ),
        endDrawer: const AppDrawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomTabBar(
                controller: _controller,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Profil Saya'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Pengaturan'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 16),
                            color: const Color(0xFFBEBEBE).withOpacity(0.16),
                            blurRadius: 24,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          const _ProfileCard(),
                          const SizedBox(height: 16),
                          Text(
                            'Pilih data yang ingin ditampilkan',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF002060),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF00D9D5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.assignment_ind,
                                      color: Color(0xFF002060),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Data Diri',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF333333),
                                        ),
                                      ),
                                      Text(
                                        'Data diri anda sesuai KTP',
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFBDBDBD),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(width: 16),
                              Container(
                                width: 48,
                                height: 48,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFEBEDF7),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.location_on,
                                  color: Color(0xFF6A6A6A),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Form(
                              child: Column(
                                children: [
                                  const AppInputForm(
                                    title: 'Nama Depan',
                                  ),
                                  const SizedBox(height: 30),
                                  const AppInputForm(
                                    title: 'Nama Belakang',
                                  ),
                                  const SizedBox(height: 30),
                                  const AppInputForm(
                                    title: 'Email',
                                  ),
                                  const SizedBox(height: 30),
                                  const AppInputForm(
                                    title: 'No Telepon',
                                  ),
                                  const SizedBox(height: 30),
                                  const AppInputForm(
                                    title: 'No. KTP',
                                  ),
                                  const SizedBox(height: 34),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.info,
                                        color: Color(0xFF002060),
                                      ),
                                      const SizedBox(width: 16),
                                      Flexible(
                                        child: Text(
                                          'Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: const Color(0xFF6A6A6A),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 34),
                                  AppButton(
                                    title: 'Simpan Profil',
                                    icon: const Icon(Icons.save),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const NotificationBanner(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 188,
      decoration: BoxDecoration(
        color: const Color(0xFF002060),
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            left: -50,
            top: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xFF1A3E78),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: -50,
            bottom: -40,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Color(0xFF1A3E78),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: -10,
            bottom: -40,
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xFF002060),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
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
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Membership BBLK',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(.55),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A3E78),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Lengkapi profile anda untuk memaksimalkan penggunaan aplikasi',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 50,
            bottom: 60,
            child: SvgPicture.asset('assets/images/dot-background.svg'),
          ),
        ],
      ),
    );
  }
}
