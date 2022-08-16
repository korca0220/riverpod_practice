import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/data/repositories/memo/memo_repository_impl.dart';
import 'package:riverpod_practice/domain/repositories/repositories.dart';
import 'package:riverpod_practice/global/interfaces/use_case/param_use_case.dart';
import 'package:riverpod_practice/global/typedef/typedefs.dart';

final getMemoUseCase = Provider<GetMemoUseCase>(
    ((ref) => GetMemoUseCase(ref.read(memoRepositoryProvider))));

class GetMemoUseCase extends ParamUseCase<NullableMemoResponse, String> {
  final MemoRepository _repository;
  GetMemoUseCase(this._repository);

  @override
  Future<NullableMemoResponse> execute(String param) {
    return _repository.get(param);
  }
}
