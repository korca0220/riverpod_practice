// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MemoDto _$$_MemoDtoFromJson(Map<String, dynamic> json) => _$_MemoDto(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_MemoDtoToJson(_$_MemoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
    };
