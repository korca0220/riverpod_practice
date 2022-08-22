import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/presentation/provider/memo_provider.dart';

final newMemoViewModelProvider =
    Provider.autoDispose<NewMemoViewMOdel>((ref) => NewMemoViewMOdel(ref));

class NewMemoViewMOdel {
  final Ref _ref;
  late TextEditingController titleController;
  late TextEditingController contentController;
  NewMemoViewMOdel(this._ref) {
    _init();
  }

  _init() {
    titleController = useTextEditingController();
    contentController = useTextEditingController();
  }

  Future<bool> addMemo() async {
    try {
      await _ref.watch(memoProvider.notifier).addMemo(
            titleController.text,
            contentController.text,
          );
      titleController.clear();
      contentController.clear();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
