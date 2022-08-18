abstract class ParamUseCase<T, P> {
  Future<T> call(P param);
}
