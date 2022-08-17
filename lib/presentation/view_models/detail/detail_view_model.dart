import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/domain/use_cases/memo/get_memo_use_case.dart';
import 'package:riverpod_practice/presentation/view_models/provider/memo_provider.dart';

final detailViewModelProvider = Provider<DetailViewModel>((ref) {
  return DetailViewModel();
});

class DetailViewModel {
  final memo = memoProvider;
}
