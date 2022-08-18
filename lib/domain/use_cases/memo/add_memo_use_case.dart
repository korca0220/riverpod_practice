import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/data/repositories/memo/memo_repository_impl.dart';
import 'package:riverpod_practice/domain/entities/memo/memo_entity.dart';
import 'package:riverpod_practice/domain/repositories/repositories.dart'
    show MemoRepository;
import 'package:riverpod_practice/global/interfaces/interfaces.dart'
    show ParamUseCase;
import 'package:riverpod_practice/global/typedef/typedefs.dart';

final addMemoUseCase = Provider<AddMemoUseCase>(
    ((ref) => AddMemoUseCase(ref.read(memoRepositoryProvider))));

class AddMemoUseCase extends ParamUseCase<BooleanMemoResponse, MemoEntity> {
  final MemoRepository _repository;
  AddMemoUseCase(this._repository);

  @override
  Future<BooleanMemoResponse> call(MemoEntity param) async {
    return _repository.create(param);
  }
}
