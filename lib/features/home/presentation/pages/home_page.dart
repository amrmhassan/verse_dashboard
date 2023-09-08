// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shared_code/shared_code.dart';
import 'package:verse_dashboard/features/home/data/constants/app_sections.dart';
import 'package:verse_dashboard/features/home/presentation/pages/widgets/home_floating_action_button.dart';
import 'package:verse_dashboard/features/home/presentation/pages/widgets/home_side_bar.dart';
import 'package:verse_dashboard/features/home/presentation/pages/widgets/section_renderer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activeSection = AppSections.apps;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          HomeFloatingActionButton(activeSection: activeSection),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: kVPad * 3,
            color: Colors.grey.withOpacity(.1),
            padding: EdgeInsets.symmetric(
              horizontal: kHPad,
              vertical: kVPad,
            ),
            child: Text(
              'Verse Home',
              style: h2TextStyle,
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeSideBar(
                  activeSection: activeSection,
                  setActiveSection: (section) {
                    setState(() {
                      activeSection = section;
                    });
                  },
                ),
                VLine(
                  color: Colors.grey.withOpacity(.1),
                ),
                Expanded(
                  child: SectionRenderer(activeSection: activeSection),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
