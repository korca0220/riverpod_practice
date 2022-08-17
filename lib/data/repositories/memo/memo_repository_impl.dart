import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/data/models/memo_dto.dart';
import 'package:riverpod_practice/data/sources/local/custom_object/memo.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod_practice/data/sources/local/memo_local_source.dart';
import 'package:riverpod_practice/domain/entities/memo/memo_entity.dart';
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
  Future<BooleanMemoResponse> create(MemoEntity memo) async {
    final result =
        await _memoLocalSource.addMemo(memoDtoMapperFromMemoEntity(memo));
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<BooleanMemoResponse> delete(String id) async {
    final result = await _memoLocalSource.deleteMemo(id);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<NullableMemoResponse> get(String id) async {
    final result = await _memoLocalSource.getMemo(id);
    return result.fold((l) => Left(l), (r) {
      if (r != null) {
        return Right(memoEntityMapperFromMemoDto(r));
      } else {
        return const Right(null);
      }
    });
  }

  @override
  Future<ListMemoResponse> getAll() async {
    final result = await _memoLocalSource.getAllMemos();
    return result.fold((l) => Left(l), (r) {
      final memoEntityList = r
          .map<MemoEntity>((memo) => memoEntityMapperFromMemoDto(memo))
          .toList();
      return Right(memoEntityList);
    });
  }

  @override
  Future<BooleanMemoResponse> update(MemoEntity memo) async {
    final result =
        await _memoLocalSource.updateMemo(memoDtoMapperFromMemoEntity(memo));
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  MemoEntity memoEntityMapperFromMemoDto(MemoDto memo) {
    return MemoEntity(
      id: memo.id,
      title: memo.title,
      content: memo.content,
      createdAt: memo.createdAt,
    );
  }

  MemoDto memoDtoMapperFromMemoEntity(MemoEntity memoEntity) {
    return MemoDto(
      id: memoEntity.id,
      title: memoEntity.title,
      content: memoEntity.content,
      createdAt: memoEntity.createdAt,
    );
  }
}
