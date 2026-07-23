import 'package:flutter/material.dart';

class GuideStepModel {
  final int step;
  final String title;
  final String description;
  final IconData icon;

  const GuideStepModel({
    required this.step,
    required this.title,
    required this.description,
    required this.icon,
  });
}