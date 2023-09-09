import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verse_dashboard/features/home/presentation/widgets/connected_apps_provider.dart';

class ProviderCalls {
  static ConnectedAppsProvider cAP(BuildContext context) {
    return Provider.of<ConnectedAppsProvider>(context);
  }

  static ConnectedAppsProvider cAPF(BuildContext context) {
    return Provider.of<ConnectedAppsProvider>(context, listen: false);
  }
}
