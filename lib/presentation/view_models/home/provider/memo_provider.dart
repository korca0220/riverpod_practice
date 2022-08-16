import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/data/sources/local/custom_object/memo.dart';
import 'package:riverpod_practice/domain/use_cases/memo/get_all_memo_use_case.dart';
import 'package:riverpod_practice/global/typedef/typedefs.dart';
import 'package:riverpod_practice/presentation/state/state.dart';

final memoProvider =
    StateNotifierProvider<MemoStateProvider, State<List<Memo>>>(((ref) {
  return MemoStateProvider(
    ref.read(getAllMemoUseCase),
  );
}));

class MemoStateProvider extends StateNotifier<State<List<Memo>>> {
  final GetAllMemoUsecase _getAllMemoUseCase;
  MemoStateProvider(this._getAllMemoUseCase) : super(const State.initial()) {
    _getInitMemo();
  }

  _getInitMemo() async {
    state = const State.loading();
    final ListMemoResponse result = await _getAllMemoUseCase.execute();
    result.fold((l) => State.error(l), (r) {
      state = State.success(r);
    });
  }
}
