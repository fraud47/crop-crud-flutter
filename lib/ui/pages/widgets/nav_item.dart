import 'package:flutter/material.dart';

import '../../../core/theme/app_pallete.dart';

class CustomNavItem extends StatelessWidget {
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomNavItem({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? AppPallete.primary : AppPallete.whiteColor,
          shape: BoxShape.circle,
        ),
        child: ImageIcon(
          AssetImage(icon,
          ),
          size: 30,
          color: isSelected ? AppPallete.whiteColor : AppPallete.greyColor,
        ),
      ),
    );
  }
}
