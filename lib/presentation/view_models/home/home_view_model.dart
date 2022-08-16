import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/presentation/view_models/home/provider/memo_provider.dart';

final homeViewModelProvider = Provider<HomeViewModel>(
  (ref) => HomeViewModel(),
);

class HomeViewModel {
  final memo = memoProvider;
}