import 'package:dartz/dartz.dart';
import 'package:riverpod_practice/data/sources/local/custom_object/memo.dart';

typedef ListMemoResponse = Either<Exception, List<Memo>>;
typedef BooleanMemoResponse = Either<Exception, bool>;
