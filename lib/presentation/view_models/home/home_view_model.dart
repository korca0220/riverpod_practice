import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/domain/entities/memo/memo_entity.dart';
import 'package:riverpod_practice/presentation/provider/memo_provider.dart';
import 'package:riverpod_practice/presentation/provider/sort_filter_provider.dart';
import 'package:riverpod_practice/presentation/state/state.dart';

final homeViewModelProvider = Provider.autoDispose<HomeViewModel>((ref) {
  return HomeViewModel(ref);
});

class HomeViewModel {
  HomeViewModel(this._ref);
  final AutoDisposeProviderRef<HomeViewModel> _ref;

  State<List<MemoEntity>> get memoState => _ref.watch(sortedMemoListState);
  SortOrder get orderState => _ref.watch(sortOrderProvider);

  deleteMemo(String id) {
    _ref.read(memoProvider.notifier).deleteMemo(id);
  }

  toggleOrderBy() {
    switch (orderState) {
      case SortOrder.ascending:
        _ref.read(sortOrderProvider.notifier).orderByDescending();
        break;
      case SortOrder.descending:
        _ref.read(sortOrderProvider.notifier).orderByAscending();
        break;
    }
  }
}
