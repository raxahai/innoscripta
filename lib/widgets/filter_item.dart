import 'package:flutter/material.dart';
import 'package:innoscripta/core/utils/app_theme.dart';

class FilterItem extends StatelessWidget {
  const FilterItem(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onClick});
  final String title;
  final bool isSelected;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onClick,
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.darkBlue),
                child: Text(title),
              ),
              Expanded(
                child: Container(),
              ),
              if (isSelected)
                Image.asset(
                  'assets/images/tick.png',
                  height: 15,
                )
              else
                const SizedBox(
                  width: 15,
                )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: AppTheme.grayUnselected,
          ),
        ],
      ),
    );
  }
}
