class APIServiceResponse<T> {
  bool isSuccess = false;
  int? statusCode;
  String? message;
  T? data;

  APIServiceResponse({
    this.isSuccess = false,
    this.statusCode,
    this.message,
    this.data,
  });

  APIServiceResponse.fromResponse(APIServiceResponse r) {
    isSuccess = r.isSuccess;
    statusCode = r.statusCode;
    message = r.message;
  }
}
