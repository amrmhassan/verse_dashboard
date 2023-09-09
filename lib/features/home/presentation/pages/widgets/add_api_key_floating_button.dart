// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_code/shared_code.dart';
import 'package:shared_code/shared_code/helper/responsive.dart';
import 'package:verse_dashboard/utils/global_utils.dart';
import 'package:verse_dashboard/utils/provider_calls.dart';

class AddApiKeyFloatingButton extends StatefulWidget {
  const AddApiKeyFloatingButton({
    super.key,
  });

  @override
  State<AddApiKeyFloatingButton> createState() =>
      _AddApiKeyFloatingButtonState();
}

class _AddApiKeyFloatingButtonState extends State<AddApiKeyFloatingButton> {
  TextEditingController nameController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cap = ProviderCalls.cAP(context);

    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kHPad / 2,
                  vertical: kVPad / 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mediumBorderRadius),
                  color: Colors.white,
                ),
                width: Responsive.getWidth(context) * .8,
                constraints: BoxConstraints(maxWidth: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VSpace(),
                    FancyTextField(
                      hint: 'Enter app name',
                      padding: EdgeInsets.zero,
                      controller: nameController,
                    ),
                    VSpace(
                      factor: .5,
                    ),
                    FancyTextField(
                      hint: 'Expires After (Days) - optional',
                      padding: EdgeInsets.zero,
                      controller: daysController,
                    ),
                    Text(
                      'if not set, the api key will be valid until deleted or deactivated',
                      style: h5InactiveTextStyle,
                    ),
                    VSpace(
                      factor: .5,
                    ),
                    MainButton(
                      active: !cap.creating,
                      onTap: () async {
                        String name = nameController.text;
                        if (name.isEmpty) return;
                        try {
                          int days = int.tryParse(daysController.text) ?? 0;
                          await ProviderCalls.cAPF(context).generateApiKey(
                            nameController.text,
                            expireAfter:
                                days == 0 ? null : Duration(days: days),
                          );
                          GlobalUtils.successSnackbar('App added');
                          Navigator.pop(context);
                        } catch (e) {
                          GlobalUtils.errorSnackbar(e.toString());
                          if (kDebugMode) rethrow;
                        }
                      },
                      title: 'Add App',
                    ),
                    VSpace(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      child: Icon(Icons.add),
    );
  }
}
