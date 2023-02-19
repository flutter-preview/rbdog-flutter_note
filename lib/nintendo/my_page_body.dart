import 'package:flutter/material.dart';
import 'package:flutter_note/nintendo/checkin_history_section.dart';
import 'package:flutter_note/nintendo/colors.dart';
import 'package:flutter_note/nintendo/fixtures.dart';
import 'package:flutter_note/nintendo/gap.dart';
import 'package:flutter_note/nintendo/play_history_section.dart';
import 'package:flutter_note/nintendo/point_section.dart';
import 'package:flutter_note/nintendo/sizes.dart';
import 'package:flutter_note/nintendo/user_history_section.dart';

class MyPageBody extends StatelessWidget {
  const MyPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p20),
      color: MyColors.lightGrey,
      child: Column(
        children: const [
          PointSection(
            silverPoints: Fixtures.slverPoints,
            goldPoints: Fixtures.goldPoints,
          ),
          Gap.h14,
          UserHistorySection(
            exampleGameTilte: Fixtures.exampleGameTilte,
            examplePlayHistory: Fixtures.examplePlayHistory,
            exampleEventTilte: Fixtures.exampleEventTilte,
          ),
          Gap.h14,
          PlayHistorySection(),
          Gap.h14,
          CheckinHistorySection(),
        ],
      ),
    );
  }
}
