import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/presentation/provider/memo_provider.dart';

final detailViewModelProvider = Provider<DetailViewModel>((ref) {
  return DetailViewModel();
});

class DetailViewModel {
  final memo = memoProvider;
}
