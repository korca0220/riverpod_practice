// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'memo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemoDto _$MemoDtoFromJson(Map<String, dynamic> json) {
  return _MemoDto.fromJson(json);
}

/// @nodoc
mixin _$MemoDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoDtoCopyWith<MemoDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoDtoCopyWith<$Res> {
  factory $MemoDtoCopyWith(MemoDto value, $Res Function(MemoDto) then) =
      _$MemoDtoCopyWithImpl<$Res>;
  $Res call({String id, String title, String? content, DateTime createdAt});
}

/// @nodoc
class _$MemoDtoCopyWithImpl<$Res> implements $MemoDtoCopyWith<$Res> {
  _$MemoDtoCopyWithImpl(this._value, this._then);

  final MemoDto _value;
  // ignore: unused_field
  final $Res Function(MemoDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_MemoDtoCopyWith<$Res> implements $MemoDtoCopyWith<$Res> {
  factory _$$_MemoDtoCopyWith(
          _$_MemoDto value, $Res Function(_$_MemoDto) then) =
      __$$_MemoDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, String? content, DateTime createdAt});
}

/// @nodoc
class __$$_MemoDtoCopyWithImpl<$Res> extends _$MemoDtoCopyWithImpl<$Res>
    implements _$$_MemoDtoCopyWith<$Res> {
  __$$_MemoDtoCopyWithImpl(_$_MemoDto _value, $Res Function(_$_MemoDto) _then)
      : super(_value, (v) => _then(v as _$_MemoDto));

  @override
  _$_MemoDto get _value => super._value as _$_MemoDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_MemoDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemoDto extends _MemoDto {
  _$_MemoDto(
      {required this.id,
      required this.title,
      this.content,
      required this.createdAt})
      : super._();

  factory _$_MemoDto.fromJson(Map<String, dynamic> json) =>
      _$$_MemoDtoFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? content;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MemoDto(id: $id, title: $title, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemoDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_MemoDtoCopyWith<_$_MemoDto> get copyWith =>
      __$$_MemoDtoCopyWithImpl<_$_MemoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemoDtoToJson(
      this,
    );
  }
}

abstract class _MemoDto extends MemoDto {
  factory _MemoDto(
      {required final String id,
      required final String title,
      final String? content,
      required final DateTime createdAt}) = _$_MemoDto;
  _MemoDto._() : super._();

  factory _MemoDto.fromJson(Map<String, dynamic> json) = _$_MemoDto.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get content;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_MemoDtoCopyWith<_$_MemoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
