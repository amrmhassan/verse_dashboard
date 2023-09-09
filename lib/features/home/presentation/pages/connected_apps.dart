// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_code/shared_code/constants/sizes.dart';
import 'package:verse_dashboard/features/home/presentation/pages/widgets/connected_app_card.dart';
import 'package:verse_dashboard/utils/provider_calls.dart';

class ConnectedApps extends StatefulWidget {
  const ConnectedApps({
    super.key,
  });

  @override
  State<ConnectedApps> createState() => _ConnectedAppsState();
}

class _ConnectedAppsState extends State<ConnectedApps> {
  void loadData() async {
    ProviderCalls.cAPF(context).loadApiKeys();
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      loadData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cap = ProviderCalls.cAP(context);
    if (cap.loading) {
      return SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kHPad,
        vertical: kVPad / 2,
      ),
      child: cap.apiKeys.isEmpty
          ? Text("No apps connected yet!")
          : ListView(
              padding: EdgeInsets.symmetric(
                horizontal: kHPad / 2,
              ),
              children: cap.apiKeys
                  .map(
                    (e) => ConnectedAppCard(
                      model: e,
                    ),
                  )
                  .toList()),
    );
  }
}
