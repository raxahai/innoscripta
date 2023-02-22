import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          const Text(
            'INNOSCRIPTA',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_appbar.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
