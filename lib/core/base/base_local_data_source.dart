abstract class BaseLocalDataSource<T> {
  Future<List<T>> getAll();
  Future<void> add(T item);
  Future<void> update(T item);
  Future<void> delete(int id);
}
