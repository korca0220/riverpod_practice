import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/data/repositories/memo/memo_repository_impl.dart';
import 'package:riverpod_practice/domain/entities/memo/memo_entity.dart';
import 'package:riverpod_practice/domain/repositories/repositories.dart';
import 'package:riverpod_practice/global/interfaces/use_case/param_use_case.dart';
import 'package:riverpod_practice/global/typedef/typedefs.dart';

final updateMemoUseCase = Provider<UpdateMemoUseCase>(
    (ref) => UpdateMemoUseCase(ref.read(memoRepositoryProvider)));

class UpdateMemoUseCase extends ParamUseCase<BooleanMemoResponse, MemoEntity> {
  final MemoRepository _repository;
  UpdateMemoUseCase(this._repository);

  @override
  Future<BooleanMemoResponse> execute(MemoEntity param) {
    return _repository.update(param);
  }
}
