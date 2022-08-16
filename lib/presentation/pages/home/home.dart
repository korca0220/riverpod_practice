import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/data/sources/local/custom_object/memo.dart';
import 'package:riverpod_practice/presentation/view_models/home/home_view_model.dart';
import 'package:uuid/uuid.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo'),
      ),
      body: Column(
        children: [
          GestureDetector(
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.red,
              child: const Center(child: Text('New Memo')),
            ),
            onTap: () {
              ref.watch(viewModel.memo.notifier).addMemo(
                    Memo(
                      id: const Uuid().v4(),
                      title: 'Hello',
                      content: 'Test',
                      createdAt: DateTime.now(),
                    ),
                  );
            },
          ),
          Expanded(
            child: ref.watch(viewModel.memo).maybeWhen(
                  orElse: () => const Center(
                    child: Text('NO data'),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  success: (value) => ListView.builder(
                    itemBuilder: ((context, index) => Dismissible(
                          key: ValueKey(value[index].id),
                          background: Container(
                              margin: const EdgeInsets.all(8),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.centerRight,
                              color: Colors.red,
                              child: const Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.white,
                              )),
                          onDismissed: (direction) {
                            ref.watch(viewModel.memo.notifier).deleteMemo(
                                  value[index].id,
                                );
                          },
                          child: ListTile(
                            title: Text(value[index].title),
                          ),
                        )),
                    itemCount: value.length,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
