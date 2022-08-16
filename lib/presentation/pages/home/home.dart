import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/presentation/view_models/home/home_view_model.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Memo'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.red,
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
                    itemBuilder: ((context, index) => ListTile(
                          title: Text(value[index].title),
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
