// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_code/shared_code/constants/sizes.dart';
import 'package:verse_dashboard/features/home/data/constants/app_sections.dart';

class SectionRenderer extends StatelessWidget {
  final String activeSection;
  const SectionRenderer({
    super.key,
    required this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    if (activeSection == AppSections.apps) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: kHPad,
          vertical: kVPad / 2,
        ),
        child: Text('This is the apps connected'),
      );
    } else {
      return SizedBox();
    }
  }
}
