import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/global/routes/pages.dart';
import 'package:riverpod_practice/presentation/view_models/home/home_view_model.dart';

import 'test_text.dart';
import 'widgets/memo_list_view.dart';
import 'widgets/order_by_buttons.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testText = useState<String>("World");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).pushNamed(RouteList.new_page.name);
          testText.value = "Hello";
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          TestText(testText: testText.value),
          const OrderByButtons(),
          const MemoListView(),
        ],
      ),
    );
  }
}
