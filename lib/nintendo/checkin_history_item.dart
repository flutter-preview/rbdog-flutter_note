import 'package:flutter/material.dart';
import 'package:flutter_sample/nintendo/colors.dart';
import 'package:flutter_sample/nintendo/text_styles.dart';

/// イベント参加の履歴 1つ分
class CheckinHistoryItem extends StatelessWidget {
  const CheckinHistoryItem({
    super.key,
    required this.eventTitle,
  });

  final String eventTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'チェックインしました',
          style: MyTextStyles.xsGreen,
        ),
        const SizedBox(
          height: 14,
        ),
        Expanded(
          child: Row(
            children: [
              Image.asset('assets/images/event.png'),
              const Spacer(),
              const Icon(
                Icons.check_circle,
                color: MyColors.green,
              ),
              const SizedBox(width: 5),
              Text(
                eventTitle,
                style: MyTextStyles.mBold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
