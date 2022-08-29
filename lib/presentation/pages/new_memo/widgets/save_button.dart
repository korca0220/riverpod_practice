import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_practice/presentation/view_models/new_memo/new_memo_view_model.dart';

class SaveButton extends ConsumerWidget {
  const SaveButton({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(newMemoViewModelProvider);
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        child: const Text('Save'),
        onPressed: () {
          viewModel.addMemo(title, content).then((value) {
            if (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Success to add memo'),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(label: 'Undo', onPressed: () {}),
                ),
              );
              return Future.delayed(const Duration(seconds: 1), () {
                GoRouter.of(context).pop();
              });
            }
          });
        },
      ),
    );
  }
}
