typedef RawData = Map<String, dynamic>;

abstract class BaseService<T extends RawData> {
  Future<String?> create(T data);
  Future<T?> read(String id);
  Future<List<T>> readAll();
  Future<bool> update(String id, T data);
  Future<bool> delete(String id);
}
