import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/dash-menu-ic.svg'),
          ),
          const Spacer(),
          SvgPicture.asset('assets/icons/cart-ic.svg'),
          const SizedBox(width: 32),
          SvgPicture.asset('assets/icons/notif-new-ic.svg'),
        ],
      ),
    );
  }
}
