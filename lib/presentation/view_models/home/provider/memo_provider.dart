import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/data/sources/local/custom_object/memo.dart';
import 'package:riverpod_practice/domain/use_cases/memo/add_memo_use_case.dart';
import 'package:riverpod_practice/domain/use_cases/memo/delete_memo_use_case.dart';
import 'package:riverpod_practice/domain/use_cases/memo/get_all_memo_use_case.dart';
import 'package:riverpod_practice/domain/use_cases/memo/get_memo_use_case.dart';
import 'package:riverpod_practice/domain/use_cases/memo/update_memo_use_case.dart';
import 'package:riverpod_practice/global/typedef/typedefs.dart';
import 'package:riverpod_practice/presentation/state/state.dart';

final memoProvider =
    StateNotifierProvider<MemoStateProvider, State<List<Memo>>>(((ref) {
  return MemoStateProvider(
    ref.read(getAllMemoUseCase),
    ref.read(addMemoUseCase),
    ref.read(deleteMemoUseCase),
    ref.read(updateMemoUseCase),
    ref.read(getMemoUseCase),
  );
}));

class MemoStateProvider extends StateNotifier<State<List<Memo>>> {
  final GetAllMemoUseCase _getAllMemoUseCase;
  final AddMemoUseCase _addMemoUseCase;
  final DeleteMemoUseCase _deleteMemoUseCase;
  final UpdateMemoUseCase _updateMemoUseCase;
  final GetMemoUseCase _getMemoUseCase;

  MemoStateProvider(
    this._getAllMemoUseCase,
    this._addMemoUseCase,
    this._deleteMemoUseCase,
    this._updateMemoUseCase,
    this._getMemoUseCase,
  ) : super(const State.initial()) {
    getAllMemo();
  }

  Future<void> getAllMemo() async {
    state = const State.loading();
    final ListMemoResponse result = await _getAllMemoUseCase.execute();
    result.fold((l) => State.error(l), (r) {
      state = State.success(r);
    });
  }

  Future<void> addMemo(Memo memo) async {
    state = const State.loading();
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
    state = const State.loading();
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

  Future<void> updateMemo(Memo memo) async {
    state = const State.loading();
    final BooleanMemoResponse result = await _updateMemoUseCase.execute(memo);
    result.fold((l) => State.error(l), (r) {
      state = State.success(state.data!.map((value) {
        if (value.id == memo.id) {
          return memo;
        } else {
          return value;
        }
      }).toList());
    });
  }

  Future<void> getMemo(String id) async {
    state = const State.loading();
    final NullableMemoResponse result = await _getMemoUseCase.execute(id);
    result.fold((l) => State.error(l), (r) {
      if (r != null) {
        state = State.success([r]);
      } else {}
    });
  }
}
