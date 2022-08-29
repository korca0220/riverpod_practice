import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/presentation/view_models/home/home_view_model.dart';

import 'memo_item.dart';

class MemoListView extends HookConsumerWidget {
  const MemoListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeViewModelProvider);
    final listAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 1000))
          ..forward();
    return Expanded(
      child: viewModel.memoState.maybeWhen(
          orElse: () => const Center(
                child: Text('NO data'),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
          success: (value) {
            return ListView.separated(
              itemBuilder: ((context, index) => FadeTransition(
                    opacity: Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: listAnimationController,
                            curve: Curves.easeOutCubic)),
                    child: SlideTransition(
                      position: Tween<Offset>(
                              begin: const Offset(0, 1),
                              end: const Offset(0, 0))
                          .animate(CurvedAnimation(
                              parent: listAnimationController,
                              curve: Curves.easeInOutSine)),
                      child: MemoItem(memoItem: value[index]),
                    ),
                  )),
              itemCount: value.length,
              separatorBuilder: (context, index) {
                return const Divider(height: 20);
              },
            );
          }),
    );
  }
}
