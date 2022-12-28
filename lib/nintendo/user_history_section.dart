import 'package:flutter/material.dart';
import 'package:flutter_sample/nintendo/checkin_history_item.dart';
import 'package:flutter_sample/nintendo/colors.dart';
import 'package:flutter_sample/nintendo/play_history_item.dart';
import 'package:flutter_sample/nintendo/text_styles.dart';

class UserHistorySection extends StatelessWidget {
  const UserHistorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      const Text(
                        '最近のきろく',
                        style: MyTextStyles.mBold,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: MyColors.darkGrey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  '今日',
                  style: MyTextStyles.lBold,
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 80,
                  child: PlayHistoryItem(gameTitle: 'あつまれどうぶつの森'),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 80,
                  child: CheckinHistoryItem(eventTitle: 'Nintendo TOKYO'),
                ),
              ],
            ),
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
                const Spacer(),
                Text(
                  'もっとみる',
                  style: MyTextStyles.mGrey,
                ),
                const SizedBox(width: 5),
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
    );
  }
}
