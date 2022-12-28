import 'package:flutter/material.dart';
import 'package:flutter_sample/nintendo/checkin_history_section.dart';
import 'package:flutter_sample/nintendo/colors.dart';
import 'package:flutter_sample/nintendo/play_history_section.dart';
import 'package:flutter_sample/nintendo/point_section.dart';
import 'package:flutter_sample/nintendo/user_history_section.dart';

class MyPageBody extends StatelessWidget {
  const MyPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: MyColors.lightGrey,
      child: Column(
        children: const [
          PointSection(
            silverPoint: 3700,
            goldPoint: 590,
          ),
          SizedBox(
            height: 14,
          ),
          UserHistorySection(),
          SizedBox(
            height: 14,
          ),
          PlayHistorySection(),
          SizedBox(
            height: 14,
          ),
          CheckinHistorySection(),
        ],
      ),
    );
  }
}
