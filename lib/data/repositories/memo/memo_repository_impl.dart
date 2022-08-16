import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/data/sources/local/custom_object/memo.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod_practice/data/sources/local/memo_local_source.dart';
import 'package:riverpod_practice/domain/repositories/memo/memo_repository.dart';
import 'package:riverpod_practice/global/typedef/typedefs.dart';

final memoRepositoryProvider = Provider<MemoRepositoryImpl>((ref) {
  return MemoRepositoryImpl();
});

class MemoRepositoryImpl implements MemoRepository {
  late MemoLocalSource _memoLocalSource;
  MemoRepositoryImpl() {
    _memoLocalSource = MemoLocalSource();
  }

  @override
  Future<BooleanMemoResponse> create(Memo memo) async {
    final result = await _memoLocalSource.addMemo(memo);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<BooleanMemoResponse> delete(String id) async {
    final result = await _memoLocalSource.deleteMemo(id);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Exception, Memo>> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<Memo>>> getAll() async {
    final result = await _memoLocalSource.getAllMemos();
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<BooleanMemoResponse> update(Memo memo) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
