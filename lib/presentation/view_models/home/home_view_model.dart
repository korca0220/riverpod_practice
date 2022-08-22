import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/domain/entities/memo/memo_entity.dart';
import 'package:riverpod_practice/presentation/provider/memo_provider.dart';
import 'package:riverpod_practice/presentation/state/state.dart';

final homeViewModelProvider = Provider<HomeViewModel>(
  (ref) => HomeViewModel(ref),
);

class HomeViewModel {
  final Ref _ref;
  HomeViewModel(this._ref);

  State<List<MemoEntity>> get memoState => _ref.watch(memoProvider);

  deleteMemo(String id) {
    _ref.watch(memoProvider.notifier).deleteMemo(id);
  }
}
