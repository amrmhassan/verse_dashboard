// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:verse_dashboard/features/home/data/models/api_key_model.dart';
import 'package:verse_dashboard/utils/provider_calls.dart';

class ToggleApiKeyActiveness extends StatelessWidget {
  const ToggleApiKeyActiveness({
    super.key,
    required this.model,
  });

  final ApiKeyModel model;

  @override
  Widget build(BuildContext context) {
    var cap = ProviderCalls.cAP(context);

    return cap.toggling == model.hash
        ? CircularProgressIndicator(
            strokeWidth: 2,
          )
        : Checkbox(
            value: model.active,
            onChanged: (value) {
              ProviderCalls.cAPF(context).toggleApiActiveness(model.hash);
            },
          );
  }
}
