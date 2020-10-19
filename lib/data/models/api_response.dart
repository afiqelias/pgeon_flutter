
class ApiResponse {

  final int status;
  final dynamic data;
  final bool hasError;
  final String errorMessage;
  
  ApiResponse({
    this.status,
    this.data,
    this.hasError,
    this.errorMessage,
  });


}
