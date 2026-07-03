import 'package:flutter/cupertino.dart';

class SupportItem {
  final String title;
  final String? subtitle;
  final IconData icon;

  const SupportItem({
    required this.title,
    required this.icon,
    this.subtitle,
  });
}