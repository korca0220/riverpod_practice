import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_practice/data/sourdes/local/custom_object/memo.dart';

class MemoLocalSource {
  MemoLocalSource() {
    _initDb();
  }
  final _kMemoBoxName = 'memo_box';

  _initDb() async {
    Hive.registerAdapter(MemoAdapter());
    await Hive.openBox<Memo>(_kMemoBoxName);
  }

  Future<void> addMemo(Memo memo) async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    await box.add(memo);
  }

  Future<void> updateMemo(Memo memo) async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    await box.put(memo.id, memo);
  }

  Future<void> deleteMemo(String id) async {
    final box = await Hive.openBox<Memo>(_kMemoBoxName);
    await box.delete(id);
  }
}
