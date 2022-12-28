import 'package:flutter/material.dart';
import 'package:flutter_sample/nintendo/button_holder.dart';
import 'package:flutter_sample/nintendo/colors.dart';
import 'package:flutter_sample/nintendo/text_styles.dart';

class MyPageHeader extends StatelessWidget {
  const MyPageHeader({
    super.key,
    required this.onPressedSettingButton,
    required this.userName,
    required this.userIconUri,
  });

  final void Function() onPressedSettingButton;
  final String userName;
  final String userIconUri;

  @override
  Widget build(BuildContext context) {
    final settingButton = IconButton(
      onPressed: onPressedSettingButton,
      icon: const Icon(Icons.settings_outlined),
    );

    final userIcon = ClipOval(
      child: Image.asset(userIconUri),
    );

    final userNameText = Text(
      userName,
      textAlign: TextAlign.left,
      style: MyTextStyles.xlBold,
    );

    final userDeatilButtonHolder = ButtonHolder(
      children: [
        IconButton(
          onPressed: onPressedSettingButton,
          icon: const Icon(
            Icons.qr_code_rounded,
            size: 18,
          ),
        ),
        IconButton(
          onPressed: onPressedSettingButton,
          icon: const Icon(
            Icons.location_on_outlined,
            size: 18,
          ),
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.all(20),
      color: MyColors.white,
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              settingButton,
            ],
          ),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                userIcon,
                const SizedBox(width: 10), // gap
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: userNameText,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: userDeatilButtonHolder,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
