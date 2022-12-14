import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/data/repositories/memo/memo_repository_impl.dart';
import 'package:riverpod_practice/domain/repositories/repositories.dart'
    show MemoRepository;
import 'package:riverpod_practice/global/interfaces/interfaces.dart'
    show NoParamUseCase;
import 'package:riverpod_practice/global/typedef/typedefs.dart';

final getAllMemoUseCase = Provider<GetAllMemoUseCase>(
  (ref) => GetAllMemoUseCase(ref.read(memoRepositoryProvider)),
);

class GetAllMemoUseCase extends NoParamUseCase<ListMemoResponse> {
  final MemoRepository _repository;
  GetAllMemoUseCase(this._repository);

  @override
  Future<ListMemoResponse> execute() {
    return _repository.getAll();
  }
}
