class ResponseModel {
  final int statusCode;
  final bool isSuccess;
  final dynamic bodyData;

  ResponseModel(
      {required this.statusCode,
      required this.isSuccess,
      required this.bodyData});


}
