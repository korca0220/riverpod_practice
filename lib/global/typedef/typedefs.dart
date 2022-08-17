import 'package:dartz/dartz.dart';
import 'package:riverpod_practice/data/sources/local/custom_object/memo.dart';
import 'package:riverpod_practice/domain/entities/memo/memo_entity.dart';

typedef ListMemoResponse = Either<Exception, List<MemoEntity>>;
typedef BooleanMemoResponse = Either<Exception, bool>;
typedef NullableMemoResponse = Either<Exception, MemoEntity?>;
