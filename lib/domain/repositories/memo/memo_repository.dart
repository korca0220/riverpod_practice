import 'package:dartz/dartz.dart';
import 'package:riverpod_practice/data/sources/local/custom_object/memo.dart';
import 'package:riverpod_practice/domain/entities/memo/memo_entity.dart';
import 'package:riverpod_practice/global/typedef/typedefs.dart';

abstract class MemoRepository {
  Future<BooleanMemoResponse> create(MemoEntity memo);
  Future<BooleanMemoResponse> update(MemoEntity memo);
  Future<BooleanMemoResponse> delete(String id);
  Future<NullableMemoResponse> get(String id);
  Future<ListMemoResponse> getAll();
}
