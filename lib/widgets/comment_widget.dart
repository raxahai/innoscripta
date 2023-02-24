import 'package:flutter/material.dart';
import 'package:innoscripta/core/utils/app_theme.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, required this.name, required this.comment});

  final String name;
  final String comment;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: AppTheme.grayUnselected),
          color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/icon_profile.png',
                      height: 32,
                      width: 32,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontSize: 16, color: AppTheme.gray4),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  comment,
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppTheme.darkBlue,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
