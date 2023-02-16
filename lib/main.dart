import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

/// メイン関数
void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString(
      'google_fonts/OFL.txt',
    );
    yield LicenseEntryWithLineBreaks(
      ['google_fonts'],
      license,
    );
  });

  const app = MyApp();
  runApp(app);
}

/// アプリ本体
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

/// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'バナナ美味しい',
              style: GoogleFonts.hachiMaruPop(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),

            // ボタン
            ElevatedButton(
              onPressed: () {
                showLicensePage(context: context);
              },
              child: Text('ボタン'),
            ),
          ],
        ),
      ),
    );
  }
}
