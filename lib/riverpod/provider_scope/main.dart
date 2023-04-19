import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_note/riverpod/provider_scope/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

main() {
  const app = MyApp(
    pages: [
      // プロバイダースコープ
      ProviderScope(child: PageA()),
      // プロバイダースコープ
      ProviderScope(child: PageB()),
    ],
  );
  runApp(app);
}

// アプリ
class MyApp extends HookWidget {
  const MyApp({
    super.key,
    required this.pages,
  });

  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    final index = useState(0);

    // タブのアイテムたち
    const items = [
      BottomNavigationBarItem(
        backgroundColor: Colors.blue,
        icon: Icon(Icons.circle),
        label: 'A',
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.green,
        icon: Icon(Icons.circle),
        label: 'B',
      ),
    ];

    // タブバー
    final bar = BottomNavigationBar(
      items: items,
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      currentIndex: index.value,
      onTap: (i) => index.value = i,
    );

    return MaterialApp(
      home: Scaffold(
        // プロバイダースコープがWidgetTreeから消えないようにする
        body: IndexedStack(
          index: index.value,
          children: pages,
        ),
        bottomNavigationBar: bar,
      ),
    );
  }
}

// 画面 A
class PageA extends ConsumerWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch
    final count = ref.watch(countNotifierProvider);
    // ボタン
    final button = FloatingActionButton(
      onPressed: () {
        ref.read(countNotifierProvider.notifier).updateState();
      },
      child: const Icon(Icons.add),
    );
    // 画面
    return Scaffold(
      floatingActionButton: button,
      body: Center(
        child: Text('$count'),
      ),
    );
  }
}

// 画面 B
class PageB extends ConsumerWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch
    final count = ref.watch(countNotifierProvider);
    // ボタン
    final button = FloatingActionButton(
      onPressed: () {
        ref.read(countNotifierProvider.notifier).updateState();
      },
      child: const Icon(Icons.add),
    );
    // 画面
    return Scaffold(
      floatingActionButton: button,
      body: Center(
        child: Text('$count'),
      ),
    );
  }
}
