import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/data/repositories/memo/memo_repository_impl.dart';
import 'package:riverpod_practice/domain/repositories/repositories.dart'
    show MemoRepository;
import 'package:riverpod_practice/global/interfaces/use_case/param_use_case.dart';
import 'package:riverpod_practice/global/typedef/typedefs.dart';

final deleteMemoUseCase = Provider<DeleteMemoUseCase>(
    ((ref) => DeleteMemoUseCase(ref.read(memoRepositoryProvider))));

class DeleteMemoUseCase extends ParamUseCase<BooleanMemoResponse, String> {
  final MemoRepository _repository;
  DeleteMemoUseCase(this._repository);

  @override
  Future<BooleanMemoResponse> call(String param) {
    return _repository.delete(param);
  }
}
