import 'package:flutter/material.dart';
import 'package:flutter_sample/nintendo/colors.dart';
import 'package:flutter_sample/nintendo/text_styles.dart';

class PointSection extends StatelessWidget {
  const PointSection({
    super.key,
    required this.silverPoint,
    required this.goldPoint,
  });

  final int silverPoint;
  final int goldPoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Text(
            'ポイント',
            style: MyTextStyles.s,
          ),
          const Spacer(),
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset('assets/images/silver-coin.png'),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '$silverPoint',
            style: MyTextStyles.lBold,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset('assets/images/gold-coin.png'),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '$goldPoint',
            style: MyTextStyles.lBold,
          ),
        ],
      ),
    );
  }
}
