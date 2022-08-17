import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_practice/data/sources/local/custom_object/memo.dart';
import 'package:riverpod_practice/global/routes/pages.dart';
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
              GoRouter.of(context).pushNamed(RouteList.new_page.name);
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
                          child: InkWell(
                            child: ListTile(
                              title: Text(value[index].title),
                              subtitle: Text(value[index].content ?? ''),
                            ),
                            onTap: () {},
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
