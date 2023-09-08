// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:verse_dashboard/features/home/data/constants/app_sections.dart';

class HomeFloatingActionButton extends StatelessWidget {
  final String activeSection;

  const HomeFloatingActionButton({
    super.key,
    required this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    if (activeSection == AppSections.apps) {
      return FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      );
    }
    return SizedBox();
  }
}
