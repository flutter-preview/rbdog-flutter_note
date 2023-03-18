import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _controllerProvider = Provider.autoDispose<TextEditingController>(
  (ref) {
    print('生まれました');
    final controller = TextEditingController();
    ref.onDispose(() {
      print('消えました');
      controller.dispose();
    });
    return controller;
  },
);

class MyForm extends ConsumerWidget {
  const MyForm({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(_controllerProvider);
    return TextField(
      controller: controller,
    );
  }
}
