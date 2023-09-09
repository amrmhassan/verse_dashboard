// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_code/shared_code/data/runtime_variables.dart';
import 'package:verse_dashboard/features/home/data/models/api_key_model.dart';
import 'package:verse_dashboard/utils/provider_calls.dart';

class DeleteApiKey extends StatelessWidget {
  final ApiKeyModel model;
  const DeleteApiKey({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var cap = ProviderCalls.cAP(context);
    return cap.deleting
        ? CircularProgressIndicator(
            strokeWidth: 2,
          )
        : IconButton(
            onPressed: () {
              ProviderCalls.cAPF(context).deleteApiHash(model.hash);
            },
            icon: Icon(
              Icons.delete,
              color: customColors.dangerColor,
            ),
          );
  }
}
