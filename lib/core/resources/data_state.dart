abstract class DataState<T> {
  const DataState({this.data, this.error});
  final T? data;
  final Exception? error;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(Exception error) : super(error: error);
}
