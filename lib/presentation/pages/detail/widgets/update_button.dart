import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_practice/presentation/view_models/detail/detail_view_model.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    Key? key,
    required this.titleController,
    required this.contentController,
    required this.viewModel,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController contentController;
  final DetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        child: const Text('Update'),
        onPressed: () {
          viewModel
              .updateMemo(titleController.text, contentController.text)
              .then(
                (value) => value ? GoRouter.of(context).pop() : Container(),
              );
        },
      ),
    );
  }
}
