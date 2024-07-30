import 'package:imepay/src/models/reponse_data.dart';

class BaseResponse {
  final String responseCode;
  final ResponseData responseData;
  final dynamic currentBalance;
  final String responseDescription;
  final dynamic referenceId;

  BaseResponse({
    required this.responseCode,
    required this.responseData,
    required this.currentBalance,
    required this.responseDescription,
    required this.referenceId,
  });

  factory BaseResponse.fromMap(Map<String, dynamic> json) => BaseResponse(
        responseCode: json["ResponseCode"],
        responseData: ResponseData.fromMap(json["ResponseData"]),
        currentBalance: json["CurrentBalance"],
        responseDescription: json["ResponseDescription"],
        referenceId: json["ReferenceID"],
      );

  Map<String, dynamic> toMap() => {
        "ResponseCode": responseCode,
        "ResponseData": responseData.toMap(),
        "CurrentBalance": currentBalance,
        "ResponseDescription": responseDescription,
        "ReferenceID": referenceId,
      };
}
