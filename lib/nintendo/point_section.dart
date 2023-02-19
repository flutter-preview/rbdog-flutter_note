import 'package:flutter/material.dart';
import 'package:flutter_note/nintendo/colors.dart';
import 'package:flutter_note/nintendo/gap.dart';
import 'package:flutter_note/nintendo/images.dart';
import 'package:flutter_note/nintendo/messages.dart';
import 'package:flutter_note/nintendo/sizes.dart';
import 'package:flutter_note/nintendo/text_styles.dart';

class PointSection extends StatelessWidget {
  const PointSection({
    super.key,
    required this.silverPoints,
    required this.goldPoints,
  });

  final int silverPoints;
  final int goldPoints;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p14),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(Sizes.p20),
      ),
      child: Row(
        children: [
          const Text(
            Messages.points,
            style: MyTextStyles.s,
          ),
          const Spacer(),
          SizedBox(
            width: Sizes.p20,
            height: Sizes.p20,
            child: Image.asset(Images.silverCoin.path),
          ),
          Gap.w5,
          Text(
            '$silverPoints',
            style: MyTextStyles.lBold,
          ),
          Gap.w10,
          SizedBox(
            width: Sizes.p20,
            height: Sizes.p20,
            child: Image.asset(Images.goldCoin.path),
          ),
          Gap.w5,
          Text(
            '$goldPoints',
            style: MyTextStyles.lBold,
          ),
        ],
      ),
    );
  }
}
