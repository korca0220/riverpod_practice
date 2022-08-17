import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_practice/data/models/memo_dto.dart';
import 'package:riverpod_practice/data/sources/local/custom_object/memo.dart';
import 'package:riverpod_practice/global/typedef/typedefs.dart';

class MemoLocalSource {
  MemoLocalSource() {
    _initDb();
  }
  final _kMemoBoxName = 'memo_box';

  _initDb() async {
    Hive.registerAdapter(MemoAdapter());
    await Hive.openBox<Memo>(_kMemoBoxName);
  }

  Future<Either<Exception, bool>> addMemo(MemoDto memo) async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    try {
      await box.put(memo.id, memoMapperFromMemoDto(memo));
      return const Right(true);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, bool>> updateMemo(MemoDto memo) async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    try {
      await box.put(memo.id, memoMapperFromMemoDto(memo));
      return const Right(true);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, bool>> deleteMemo(String id) async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    try {
      await box.delete(id);
      return const Right(true);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, MemoDto?>> getMemo(String id) async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    try {
      final memo = box.get(id);
      return Right(memoDtoMapperFromMemo(memo!));
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, List<MemoDto>>> getAllMemos() async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    try {
      final memoList =
          box.values.map<MemoDto>((e) => memoDtoMapperFromMemo(e)).toList();
      return Right(memoList);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  MemoDto memoDtoMapperFromMemo(Memo memo) {
    return MemoDto(
      id: memo.id,
      title: memo.title,
      content: memo.content,
      createdAt: memo.createdAt,
    );
  }

  Memo memoMapperFromMemoDto(MemoDto memo) {
    return Memo(
      id: memo.id,
      title: memo.title,
      content: memo.content,
      createdAt: memo.createdAt,
    );
  }
}
