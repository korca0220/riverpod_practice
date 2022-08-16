import 'package:dartz/dartz.dart';
import 'package:riverpod_practice/data/sources/local/custom_object/memo.dart';
import 'package:riverpod_practice/global/typedef/typedefs.dart';

abstract class MemoRepository {
  Future<Either<Exception, bool>> create(Memo memo);
  Future<Either<Exception, Memo>> update(Memo memo);
  Future<Either<Exception, Memo>> delete(String id);
  Future<Either<Exception, Memo>> get(String id);
  Future<ListMemoResponse> getAll();
}
