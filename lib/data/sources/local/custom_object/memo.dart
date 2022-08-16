import 'package:hive_flutter/hive_flutter.dart';

part 'memo.g.dart';

@HiveType(typeId: 0)
class Memo {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String? content;

  @HiveField(3)
  DateTime createdAt;

  Memo({
    required this.id,
    required this.title,
    this.content,
    required this.createdAt,
  });
}
