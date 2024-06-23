class APIServiceResponse<T> {
  bool isSuccess = false;
  String? statusText = "failed";
  int? statusCode;
  String? message;
  T? data;

  APIServiceResponse({
    this.isSuccess = false,
    this.statusText,
    this.statusCode,
    this.message,
    this.data,
  });

  APIServiceResponse.fromResponse(APIServiceResponse r) {
    isSuccess = r.isSuccess;
    statusText = r.statusText;
    statusCode = r.statusCode;
    message = r.message;
  }
}
