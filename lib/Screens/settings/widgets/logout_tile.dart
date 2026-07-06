import 'package:flutter/material.dart';

class LogoutTile extends StatelessWidget {
  final VoidCallback onTap;

  const LogoutTile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: const Icon(Icons.logout, color: Colors.red),
        title: const Text(
          "Logout",
          style: TextStyle(color: Colors.red),
        ),
        onTap: onTap,
      ),
    );
  }
}