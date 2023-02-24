import 'package:flutter/material.dart';
import 'package:innoscripta/core/utils/app_theme.dart';

class EpicTileWidget extends StatelessWidget {
  const EpicTileWidget(
      {super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.grayUnselected,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
            child: Row(
              children: [
                Image.asset(
                  height: 20,
                  width: 20,
                  'assets/images/icon_radioButton.png',
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.graySelected),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
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
