import 'package:flutter/material.dart';
import 'package:flutter_sample/nintendo/colors.dart';
import 'package:flutter_sample/nintendo/text_styles.dart';

/// イベント参加の履歴 セクション
class CheckinHistorySection extends StatelessWidget {
  const CheckinHistorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: Container(
        color: MyColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/map.png',
            ),
            Divider(
              thickness: 1.5,
              height: 1.5,
              color: MyColors.lightGrey,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
              child: Row(
                children: [
                  const Text(
                    'チェックインした記録',
                    style: MyTextStyles.mBold,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: MyColors.darkGrey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
