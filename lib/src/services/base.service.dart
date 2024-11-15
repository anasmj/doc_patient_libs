typedef RawData = Map<String, dynamic>;

abstract class BaseService<T> {
  Future<String?> create(T data);
  Future<T?> getSingle(String id);
  Future<List<T>> getAll();
  Future<bool> update(String id, T data);
  Future<bool> delete(String id);
}
