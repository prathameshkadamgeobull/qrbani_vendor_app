import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const DrawerTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 3,
      ),
      child: Material(
        color: isSelected
            ? Colors.white.withOpacity(.12)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight:
              isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}