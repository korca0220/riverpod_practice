import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_practice/global/routes/pages.dart';
import 'package:riverpod_practice/presentation/provider/memo_provider.dart';
import 'package:riverpod_practice/presentation/provider/sort_filter_provider.dart';
import 'package:riverpod_practice/presentation/view_models/home/home_view_model.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).pushNamed(RouteList.new_page.name);
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 40,
                    color: viewModel.orderState == SortOrder.ascending
                        ? Colors.red
                        : Colors.grey,
                    child: const Center(child: Text('Ascending')),
                  ),
                  onTap: () {
                    viewModel.toggleOrderBy();
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 40,
                    color: viewModel.orderState == SortOrder.descending
                        ? Colors.red
                        : Colors.grey,
                    child: const Center(child: Text('Descending')),
                  ),
                  onTap: () {
                    viewModel.toggleOrderBy();
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: viewModel.memoState.maybeWhen(
              orElse: () => const Center(
                child: Text('NO data'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              success: (value) => ListView.separated(
                itemBuilder: ((context, index) => Dismissible(
                      key: ValueKey(value[index].id),
                      background: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          child: const Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.white,
                          )),
                      onDismissed: (direction) {
                        viewModel.deleteMemo(value[index].id);
                      },
                      child: InkWell(
                        child: SizedBox(
                          height: 50,
                          child: ListTile(
                            title: Text(
                              value[index].title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(value[index].content ?? ''),
                                Text(value[index].createdAt.toIso8601String()),
                              ],
                            ),
                            dense: true,
                          ),
                        ),
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                            RouteList.detail_page.name,
                            params: {'id': value[index].id},
                          );
                        },
                      ),
                    )),
                itemCount: value.length,
                separatorBuilder: (context, index) {
                  return const Divider(height: 20);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
