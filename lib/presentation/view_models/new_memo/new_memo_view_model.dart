import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/presentation/view_models/provider/memo_provider.dart';

final newMemoViewModelProvider =
    Provider<NewMemoViewMOdel>((ref) => NewMemoViewMOdel());

class NewMemoViewMOdel {
  final memo = memoProvider;
}
