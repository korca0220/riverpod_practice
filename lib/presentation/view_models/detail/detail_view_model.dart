import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/domain/entities/memo/memo_entity.dart';
import 'package:riverpod_practice/global/interfaces/view_model/view_model.dart';
import 'package:riverpod_practice/presentation/provider/memo_provider.dart';

final detailViewModelProvider =
    Provider.family.autoDispose<DetailViewModel, String>((ref, id) {
  return DetailViewModel(ref, id);
});

class DetailViewModel extends ViewModelInterface {
  final Ref _ref;
  final String _id;
  late TextEditingController titleController;
  late TextEditingController contentController;
  DetailViewModel(this._ref, this._id);

  MemoEntity get memo =>
      _ref.read(memoProvider).data!.firstWhere((m) => m.id == _id);

  @override
  init() {
    titleController = useTextEditingController(text: memo.title);
    contentController = useTextEditingController(text: memo.content);
  }

  Future<bool> updateMemo() async {
    try {
      final updateMemo = MemoEntity(
        id: memo.id,
        title: titleController.text,
        content: contentController.text,
        createdAt: DateTime.now(),
      );
      await _ref.read(memoProvider.notifier).updateMemo(updateMemo);
      titleController.clear();
      contentController.clear();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
