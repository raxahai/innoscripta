import 'package:flutter/material.dart';

class StaticAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StaticAppBar({Key? key, this.showBackButton = false}) : super(key: key);

  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: showBackButton ? const BackButton() : null,
      title: Row(
        mainAxisAlignment:
            showBackButton ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          if (showBackButton)
            const SizedBox(
              width: 50,
            ),
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
