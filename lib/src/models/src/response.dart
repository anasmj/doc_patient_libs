class Response<T> {
  final T? data;
  final String? message;
  final int statusCode;

  const Response({
    this.data,
    this.message,
    required this.statusCode,
  });

  factory Response.success(T data) {
    return Response(data: data, statusCode: 200);
  }

  // Factory method for error
  factory Response.error(String errorMessage, {int statusCode = 500}) {
    return Response(message: errorMessage, statusCode: statusCode);
  }

  bool get isSuccess => statusCode >= 200 && statusCode < 300;
}
