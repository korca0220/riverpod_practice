import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/presentation/view_models/new_memo/new_memo_view_model.dart';

class NewMemo extends HookConsumerWidget {
  const NewMemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(newMemoViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Memo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(child: Text('Title ')),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: viewModel.titleController,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(child: Text('Content')),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: viewModel.contentController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  viewModel.addMemo().then((value) {
                    if (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Success to add memo'),
                          duration: const Duration(seconds: 2),
                          action:
                              SnackBarAction(label: 'Undo', onPressed: () {}),
                        ),
                      );
                      return Future.delayed(const Duration(seconds: 1), () {
                        GoRouter.of(context).pop();
                      });
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
