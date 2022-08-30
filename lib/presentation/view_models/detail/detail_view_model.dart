import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/domain/entities/memo/memo_entity.dart';
import 'package:riverpod_practice/global/interfaces/view_model/view_model.dart';
import 'package:riverpod_practice/presentation/provider/memo_provider.dart';

final detailViewModelProvider =
    Provider.family<DetailViewModel, String>((ref, id) {
  return DetailViewModel(ref, id);
});

class DetailViewModel extends ViewModelInterface {
  final Ref _ref;
  final String _id;
  DetailViewModel(this._ref, this._id);
  MemoEntity? memo;

  @override
  init() {
    final data = _ref.watch(memoProvider).data;
    if (data != null) {
      memo = data.firstWhere((element) => element.id == _id);
    }
  }

  Future<bool> updateMemo(String title, String content) async {
    try {
      final updateMemo = MemoEntity(
        id: memo!.id,
        title: title,
        content: content,
        createdAt: DateTime.now(),
      );
      await _ref.read(memoProvider.notifier).updateMemo(updateMemo);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
