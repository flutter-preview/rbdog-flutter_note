import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  final app = MaterialApp(home: Home());
  final scope = ProviderScope(child: app);
  runApp(scope);
}

// ID付きのアイテム
class IdItem {
  IdItem({
    required this.id,
    required this.text,
  });
  final String id;
  final String text;
}

final radioItems = [
  IdItem(id: 'A', text: 'ラジオボタンA'),
  IdItem(id: 'B', text: 'ラジオボタンB'),
  IdItem(id: 'C', text: 'ラジオボタンC'),
];

final checkboxItems = [
  IdItem(id: 'A', text: 'チェックボックスA'),
  IdItem(id: 'B', text: 'チェックボックスB'),
  IdItem(id: 'C', text: 'チェックボックスC'),
];

final radioIdProvider = StateProvider<String?>((ref) {
  return null;
});

final checkedIdsProvider = StateProvider<Set<String>>((ref) {
  return {};
});

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioId = ref.watch(radioIdProvider);
    final checkedIds = ref.watch(checkedIdsProvider);

    final col = Column(
      children: [
        ...List<Widget>.generate(
          radioItems.length,
          (index) {
            final item = radioItems[index];
            return RadioListTile(
              groupValue: radioId,
              onChanged: (id) {
                final notifier = ref.read(radioIdProvider.notifier);
                notifier.state = id.toString();
              },
              value: item.id,
              title: Text(item.text),
            );
          },
        ),
        ...List<Widget>.generate(
          checkboxItems.length,
          (index) {
            final item = checkboxItems[index];
            return CheckboxListTile(
              title: Text(item.text),
              value: checkedIds.contains(item.id),
              onChanged: (checked) {
                if (checked!) {
                  checkedIds.add(item.id);
                } else {
                  checkedIds.remove(item.id);
                }
                final notifier = ref.read(checkedIdsProvider.notifier);
                notifier.state = {...checkedIds};
              },
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            print(radioId);
            print(checkedIds);
          },
          child: const Text('OK'),
        ),
      ],
    );

    return Scaffold(
      body: col,
    );
  }
}
