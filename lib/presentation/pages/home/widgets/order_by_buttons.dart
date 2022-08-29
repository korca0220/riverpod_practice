import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/presentation/provider/sort_filter_provider.dart';
import 'package:riverpod_practice/presentation/view_models/home/home_view_model.dart';

class OrderByButtons extends StatelessWidget {
  const OrderByButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final viewModel = ref.watch(homeViewModelProvider);
      return Row(
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
      );
    });
  }
}
