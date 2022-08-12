import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/data/sourdes/local/custom_object/memo.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod_practice/data/sourdes/local/memo_local_source.dart';
import 'package:riverpod_practice/domain/repositories/memo/memo_repository.dart';

final memoRepositoryProvider = FutureProvider<MemoRepositoryImpl>((ref) {
  return MemoRepositoryImpl();
});

class MemoRepositoryImpl implements MemoRepository {
  late MemoLocalSource _memoLocalSource;
  MemoRepositoryImpl() {
    _memoLocalSource = MemoLocalSource();
  }

  @override
  Future<Either<Exception, bool>> create(Memo memo) async {
    final result = await _memoLocalSource.addMemo(memo);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Exception, Memo>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Memo>> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<Memo>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Memo>> update(Memo memo) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
