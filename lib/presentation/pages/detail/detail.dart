import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/presentation/view_models/detail/detail_view_model.dart';

import 'widgets/content_body.dart';
import 'widgets/title_header.dart';
import 'widgets/update_button.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage({required this.id, Key? key}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(detailViewModelProvider(id));
    final titleController =
        useTextEditingController(text: viewModel.memo.title);
    final contentController =
        useTextEditingController(text: viewModel.memo.content);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TitleHeader(titleController: titleController),
            const SizedBox(height: 20),
            ContentBody(contentController: contentController),
            const SizedBox(height: 20),
            UpdateButton(
              titleController: titleController,
              contentController: contentController,
              viewModel: viewModel,
            ),
          ],
        ),
      ),
    );
  }
}
