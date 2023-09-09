// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:verse_dashboard/features/home/data/constants/app_sections.dart';
import 'package:verse_dashboard/features/home/presentation/pages/widgets/add_api_key_floating_button.dart';

class HomeFloatingActionButton extends StatelessWidget {
  final String activeSection;

  const HomeFloatingActionButton({
    super.key,
    required this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    if (activeSection == AppSections.apps) {
      return AddApiKeyFloatingButton();
    }
    return SizedBox();
  }
}
