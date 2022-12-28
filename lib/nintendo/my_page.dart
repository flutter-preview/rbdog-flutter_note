import 'package:flutter/material.dart';
import 'package:flutter_sample/nintendo/my_page_body.dart';
import 'package:flutter_sample/nintendo/my_page_header.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyPageHeader(
            onPressedSettingButton: () {},
            userName: 'まい',
            userIconUri: 'assets/images/user-icon.png',
          ),
          const MyPageBody(),
        ],
      ),
    );
  }
}
