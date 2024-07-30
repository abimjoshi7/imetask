import 'package:equatable/equatable.dart';

class RewardDetailsDTO extends Equatable {
  final int currentCredits;
  final String memberType;
  final String msisdn;

  const RewardDetailsDTO({
    required this.currentCredits,
    required this.memberType,
    required this.msisdn,
  });

  factory RewardDetailsDTO.fromJson(Map<String, dynamic> json) =>
      RewardDetailsDTO(
        currentCredits: json["CurrentCredits"],
        memberType: json["MemberType"],
        msisdn: json["Msisdn"],
      );

  Map<String, dynamic> toJson() => {
        "CurrentCredits": currentCredits,
        "MemberType": memberType,
        "Msisdn": msisdn,
      };

  @override
  List<Object> get props => [currentCredits, memberType, msisdn];
}
