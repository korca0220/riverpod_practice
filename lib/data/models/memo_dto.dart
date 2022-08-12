import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo_dto.freezed.dart';
part 'memo_dto.g.dart';

@freezed
class MemoDto with _$MemoDto {
  factory MemoDto({
    required String id,
    required String title,
    String? content,
    required DateTime createdAt,
  }) = _MemoDto;
  const MemoDto._();

  factory MemoDto.fromJson(Map<String, dynamic> json) =>
      _$MemoDtoFromJson(json);
}
