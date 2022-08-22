import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class MemoEntity {
  const MemoEntity({
    required this.id,
    required this.title,
    required this.createdAt,
    this.content = '',
    this.completed = false,
  });

  final String id;
  final String title;
  final String? content;
  final DateTime createdAt;
  final bool completed;
}
