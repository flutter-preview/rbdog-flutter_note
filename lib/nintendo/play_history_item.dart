import 'package:flutter/material.dart';
import 'package:flutter_sample/nintendo/text_styles.dart';

/// 遊んだゲームの履歴 1つ分
class PlayHistoryItem extends StatelessWidget {
  const PlayHistoryItem({
    super.key,
    required this.gameTitle,
  });

  final String gameTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/animal-crossing.png'),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                gameTitle,
                style: MyTextStyles.sGrey,
              ),
              const Spacer(),
              const Text(
                '1時間0分',
                textAlign: TextAlign.right,
                style: MyTextStyles.lBold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
