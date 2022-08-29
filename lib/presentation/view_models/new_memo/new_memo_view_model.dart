import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/global/interfaces/view_model/view_model.dart';
import 'package:riverpod_practice/presentation/provider/memo_provider.dart';

final newMemoViewModelProvider =
    Provider.autoDispose<NewMemoViewMOdel>((ref) => NewMemoViewMOdel(ref));

class NewMemoViewMOdel extends ViewModelInterface {
  final Ref _ref;

  NewMemoViewMOdel(this._ref);

  Future<bool> addMemo(String title, String content) async {
    try {
      await _ref.read(memoProvider.notifier).addMemo(
            title,
            content,
          );

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
