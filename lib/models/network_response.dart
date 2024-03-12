class NetworkResponse<T, U> {
  final int statusCode;
  final bool isError;
  final String message;

  final T? data;
  final U? errorData;

  NetworkResponse.success({
    required this.statusCode,
    required this.data,
    required this.message,
  })  : isError = false,
        errorData = null;

  NetworkResponse.error({
    required this.statusCode,
    required this.message,
    required this.errorData,
  })  : isError = true,
        data = null;

  @override
  String toString() {
    return 'NetworkResponse{statusCode: $statusCode, isError: $isError, data: $data, message: $message, errorData: $errorData}';
  }
}