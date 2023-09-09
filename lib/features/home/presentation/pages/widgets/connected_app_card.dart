// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_code/shared_code.dart';
import 'package:verse_dashboard/features/home/data/models/api_key_model.dart';
import 'package:shared_code/shared_code/widgets/custom_card.dart';
import 'package:verse_dashboard/utils/global_utils.dart';

class ConnectedAppCard extends StatelessWidget {
  final ApiKeyModel model;
  const ConnectedAppCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderRadius: mediumBorderRadius,
      shadowColor: Colors.grey.withOpacity(.1),
      margin: EdgeInsets.only(
        bottom: kVPad / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: double.infinity),
          Row(
            children: [
              Expanded(
                child: Text(
                  model.name,
                  style: h4TextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: customColors.dangerColor,
                ),
              ),
              Checkbox(value: model.active, onChanged: (value) {}),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  model.expireAfter == null
                      ? 'Never expires'
                      : 'Expires after ${_getApiKeyLife(model.expireAfter!)}',
                  style: h4TextStyleInactive,
                ),
              ),
              Text(
                '${model.hash.substring(0, 20)}...',
                style: h4LiteTextStyle,
              ),
              IconButton(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: model.hash));
                  GlobalUtils.successSnackbar(
                    'Full api key copied to clipboard',
                  );
                },
                icon: Icon(
                  Icons.copy,
                  size: smallIconSize,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String _getApiKeyLife(Duration duration) {
  int days = duration.inDays;
  if (days != 0) {
    return '$days days';
  }
  int hours = duration.inHours;
  if (hours != 0) {
    return '$hours hours';
  }
  int minutes = duration.inMinutes;
  if (minutes != 0) {
    return '$minutes minutes';
  }
  int seconds = duration.inSeconds;
  return '$seconds seconds';
}
