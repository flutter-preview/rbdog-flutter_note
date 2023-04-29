import 'package:flutter/material.dart';
import 'package:flutter_note/sign_in/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/// メイン関数
void main() async {
  // Firebase の準備
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 練習用の通信をする
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  const app = MyApp();
  const scope = ProviderScope(child: app);
  runApp(scope);
}

/// ---------------------------------------------------------
/// アプリ本体    >> app.dart
/// ---------------------------------------------------------
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
