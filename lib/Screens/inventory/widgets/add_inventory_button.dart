import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class AddInventoryButton extends StatefulWidget {
  final VoidCallback onPressed;

  const AddInventoryButton({
    super.key,
    required this.onPressed,
  });

  @override
  State<AddInventoryButton> createState() =>
      _AddInventoryButtonState();
}

class _AddInventoryButtonState
    extends State<AddInventoryButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: widget.onPressed,
        icon: const Icon(
          Icons.add,
          color: Colors.white,
          size: 22,
        ),
        label: Text(
          "Add Inventory",
          style: AppTextStyles.buttonText,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff0B8A47),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}