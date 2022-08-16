import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_practice/data/sources/local/custom_object/memo.dart';
import 'package:riverpod_practice/global/typedef/typedefs.dart';

// final memoLocalSourceProvider =
//     FutureProvider<MemoLocalSource>(((ref) => MemoLocalSource()));

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

  Future<void> updateMemo(Memo memo) async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    await box.put(memo.id, memo);
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

  Future<Memo?> getMemo(String id) async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    return box.get(id);
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
