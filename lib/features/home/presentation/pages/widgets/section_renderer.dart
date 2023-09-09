// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:verse_dashboard/features/home/data/constants/app_sections.dart';
import 'package:verse_dashboard/features/home/presentation/pages/connected_apps.dart';

class SectionRenderer extends StatelessWidget {
  final String activeSection;
  const SectionRenderer({
    super.key,
    required this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    if (activeSection == AppSections.apps) {
      return ConnectedApps();
    } else {
      return SizedBox();
    }
  }
}
