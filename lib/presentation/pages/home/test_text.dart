import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/presentation/view_models/home/home_view_model.dart';

class TestText extends ConsumerWidget {
  const TestText({
    Key? key,
    required this.testText,
  }) : super(key: key);

  final String testText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeViewModelProvider);
    return Column(
      children: [
        viewModel.memoState.isLoading
            ? const Text('')
            : Text(
                viewModel.memoState.data!.length.toString(),
              ),
        const SizedBox(height: 20),
        Text(testText),
      ],
    );
  }
}
