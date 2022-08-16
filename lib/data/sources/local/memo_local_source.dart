import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

  Future<BooleanMemoResponse> addMemo(Memo memo) async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    try {
      await box.put(memo.id, memo);
      return const Right(true);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<BooleanMemoResponse> updateMemo(Memo memo) async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    try {
      await box.put(memo.id, memo);
      return const Right(true);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<BooleanMemoResponse> deleteMemo(String id) async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    try {
      await box.delete(id);
      return const Right(true);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<NullableMemoResponse> getMemo(String id) async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    try {
      final memo = box.get(id);
      return Right(memo);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<ListMemoResponse> getAllMemos() async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    try {
      final memoList = box.values.toList();
      return Right(memoList);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
