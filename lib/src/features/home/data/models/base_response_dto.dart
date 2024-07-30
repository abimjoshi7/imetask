import 'package:imepay/src/features/home/data/models/reponse_data_dto.dart';

class BaseResponseDTO {
  final String responseCode;
  final ResponseDataDTO responseData;
  final dynamic currentBalance;
  final String responseDescription;
  final dynamic referenceId;

  BaseResponseDTO({
    required this.responseCode,
    required this.responseData,
    required this.currentBalance,
    required this.responseDescription,
    required this.referenceId,
  });

  factory BaseResponseDTO.fromJson(Map<String, dynamic> json) =>
      BaseResponseDTO(
        responseCode: json["ResponseCode"],
        responseData: ResponseDataDTO.fromJson(json["ResponseData"]),
        currentBalance: json["CurrentBalance"],
        responseDescription: json["ResponseDescription"],
        referenceId: json["ReferenceID"],
      );

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode,
        "ResponseData": responseData.toJson(),
        "CurrentBalance": currentBalance,
        "ResponseDescription": responseDescription,
        "ReferenceID": referenceId,
      };
}
