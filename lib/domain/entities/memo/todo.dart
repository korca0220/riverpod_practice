import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Memo {
  const Memo({
    required this.id,
    required this.title,
    required this.createdAt,
    this.content = '',
  });

  final String id;
  final String title;
  final String? content;
  final DateTime createdAt;
}

class MemoList extends StateNotifier<List<Memo>> {
  MemoList({List<Memo>? initialMemos}) : super(initialMemos ?? []);
}
