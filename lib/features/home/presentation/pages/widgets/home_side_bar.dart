import 'package:flutter/material.dart';
import 'package:shared_code/shared_code/constants/sizes.dart';
import 'package:verse_dashboard/features/home/data/constants/app_sections.dart';

class HomeSideBar extends StatelessWidget {
  final String activeSection;
  final void Function(String section) setActiveSection;
  const HomeSideBar({
    super.key,
    required this.activeSection,
    required this.setActiveSection,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kVPad * 8,
      child: ListView(
          children: AppSections.values
              .map(
                (e) => Container(
                  color:
                      activeSection == e ? Colors.grey.withOpacity(.05) : null,
                  child: ListTile(
                    onTap: () {
                      setActiveSection(e);
                    },
                    title: Text(e),
                  ),
                ),
              )
              .toList()),
    );
  }
}
