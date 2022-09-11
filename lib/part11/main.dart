import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample/part11/page_a.dart';
import 'package:flutter_sample/part11/page_b.dart';
import 'package:flutter_sample/part11/page_c.dart';
import 'package:flutter_sample/part11/router.dart';

main() {
  const home = Home();
  const app = MaterialApp(home: home);
  const scope = ProviderScope(child: app);
  runApp(scope);
}

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageNumber = ref.watch(pageNumberProvider);
    return Navigator(
      pages: [
        if (pageNumber >= 1)
          const MaterialPage(
            child: PageA(),
          ),
        if (pageNumber >= 2)
          const MaterialPage(
            child: PageB(),
          ),
        if (pageNumber >= 3)
          const MaterialPage(
            child: PageC(),
          )
      ],
      onPopPage: ((route, result) {
        return false;
      }),
    );
  }
}
