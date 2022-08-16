import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/data/sources/local/custom_object/memo.dart';
import 'package:riverpod_practice/domain/use_cases/memo/add_memo_use_case.dart';
import 'package:riverpod_practice/domain/use_cases/memo/delete_memo_use_case.dart';
import 'package:riverpod_practice/domain/use_cases/memo/get_all_memo_use_case.dart';
import 'package:riverpod_practice/global/typedef/typedefs.dart';
import 'package:riverpod_practice/presentation/state/state.dart';

final memoProvider =
    StateNotifierProvider<MemoStateProvider, State<List<Memo>>>(((ref) {
  return MemoStateProvider(
    ref.read(getAllMemoUseCase),
    ref.read(addMemoUseCase),
    ref.read(deleteMemoUseCase),
  );
}));

class MemoStateProvider extends StateNotifier<State<List<Memo>>> {
  final GetAllMemoUseCase _getAllMemoUseCase;
  final AddMemoUseCase _addMemoUseCase;
  final DeleteMemoUseCase _deleteMemoUseCase;

  MemoStateProvider(
      this._getAllMemoUseCase, this._addMemoUseCase, this._deleteMemoUseCase)
      : super(const State.initial()) {
    _getInitMemo();
  }

  _getInitMemo() async {
    state = const State.loading();
    final ListMemoResponse result = await _getAllMemoUseCase.execute();
    result.fold((l) => State.error(l), (r) {
      state = State.success(r);
    });
  }

  Future<void> addMemo(Memo memo) async {
    final BooleanMemoResponse result = await _addMemoUseCase.execute(memo);
    result.fold((l) => State.error(l), (r) {
      if (state.data != null) {
        state = State.success(state.data! + [memo]);
      } else {
        state = State.success([memo]);
      }
    });
  }

  Future<void> deleteMemo(String id) async {
    final BooleanMemoResponse result = await _deleteMemoUseCase.execute(id);
    result.fold((l) => State.error(l), (r) {
      if (state.data != null) {
        state =
            State.success(state.data!.where((memo) => memo.id != id).toList());
      } else {
        state = State.error(Exception('No memo found'));
      }
    });
  }
}