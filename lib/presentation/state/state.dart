import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class State<T> with _$State<T> {
  const factory State.initial() = _initial<T>;
  const factory State.loading() = _loading;
  const factory State.success(final T data) = _success<T>;
  const factory State.error(final Exception failure) = _error;
  const State._();

  bool get isInit => maybeWhen(initial: () => true, orElse: () => false);

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  bool get isSuccess => maybeWhen(success: (_) => true, orElse: () => false);

  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);

  T? get data => maybeWhen(success: (data) => data, orElse: () => null);
}
