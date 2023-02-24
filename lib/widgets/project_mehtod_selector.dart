import 'package:flutter/material.dart';
import 'package:innoscripta/core/utils/app_theme.dart';

class ProjectMethodSelector extends StatelessWidget {
  const ProjectMethodSelector(
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
      onTap: onClick,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected
                    ? AppTheme.graySelected
                    : AppTheme.grayUnselected)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const Spacer(),
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
        ),
      ),
    );
  }
}
