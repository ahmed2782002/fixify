import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String icon;
  final String activeIcon;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.icon,
    required this.activeIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isSelected)
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF006BAA),
                shape: BoxShape.circle,
              ),
            ),
          Image.asset(isSelected ? activeIcon : icon, width: 32, height: 32),
        ],
      ),
    );
  }
}
