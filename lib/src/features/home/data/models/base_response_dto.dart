import 'package:imepay/src/features/home/data/models/reponse_data_dto.dart';

class BaseResponseDTO {
  final String responseCode;
  final ResponseDataDTO responseData;
  final String responseDescription;

  BaseResponseDTO({
    required this.responseCode,
    required this.responseData,
    required this.responseDescription,
  });

  factory BaseResponseDTO.fromJson(Map<String, dynamic> json) =>
      BaseResponseDTO(
        responseCode: json["ResponseCode"],
        responseData: ResponseDataDTO.fromJson(json["ResponseData"]),
        responseDescription: json["ResponseDescription"],
      );

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode,
        "ResponseData": responseData.toJson(),
        "ResponseDescription": responseDescription,
      };
}
