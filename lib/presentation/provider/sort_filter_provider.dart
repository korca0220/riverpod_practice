import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SortOrder {
  ascending,
  descending,
}

final sortOrderProvider =
    StateNotifierProvider<SortOrderState, SortOrder>((_) => SortOrderState());

class SortOrderState extends StateNotifier<SortOrder> {
  SortOrderState() : super(SortOrder.ascending);

  orderByAscending() => state = SortOrder.ascending;

  orderByDescending() => state = SortOrder.descending;
}
