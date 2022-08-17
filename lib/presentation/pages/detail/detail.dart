import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/domain/entities/memo/memo_entity.dart';
import 'package:riverpod_practice/presentation/view_models/detail/detail_view_model.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage({required this.id, Key? key}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(detailViewModelProvider);
    final memo = ref.watch(viewModel.memo).data!.firstWhere((m) => m.id == id);
    final titleController = useTextEditingController(text: memo.title);
    final contentController = useTextEditingController(text: memo.content);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
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
                      controller: titleController,
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
                    controller: contentController,
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
                child: const Text('Update'),
                onPressed: () {
                  ref.watch(viewModel.memo.notifier).updateMemo(
                        MemoEntity(
                          id: id,
                          title: titleController.text,
                          content: contentController.text,
                          createdAt: DateTime.now(),
                        ),
                      );
                  titleController.clear();
                  contentController.clear();
                  GoRouter.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
