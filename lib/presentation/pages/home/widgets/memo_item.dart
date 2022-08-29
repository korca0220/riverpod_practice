import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_practice/domain/entities/memo/memo_entity.dart';
import 'package:riverpod_practice/global/routes/pages.dart';
import 'package:riverpod_practice/presentation/view_models/home/home_view_model.dart';

class MemoItem extends StatelessWidget {
  const MemoItem({Key? key, required this.memoItem}) : super(key: key);

  final MemoEntity memoItem;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final viewModel = ref.watch(homeViewModelProvider);
      return Dismissible(
        key: ValueKey(memoItem.id),
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
          viewModel.deleteMemo(memoItem.id);
        },
        child: InkWell(
          child: SizedBox(
            height: 50,
            child: ListTile(
              title: Text(
                memoItem.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(memoItem.content ?? ''),
                  Text(memoItem.createdAt.toIso8601String()),
                ],
              ),
              dense: true,
            ),
          ),
          onTap: () {
            GoRouter.of(context).pushNamed(
              RouteList.detail_page.name,
              params: {'id': memoItem.id},
            );
          },
        ),
      );
    });
  }
}
