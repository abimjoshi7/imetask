import 'package:equatable/equatable.dart';

class RewardDetails extends Equatable {
  final int currentCredits;
  final String memberType;
  final String msisdn;

  const RewardDetails({
    required this.currentCredits,
    required this.memberType,
    required this.msisdn,
  });

  factory RewardDetails.fromMap(Map<String, dynamic> json) => RewardDetails(
        currentCredits: json["CurrentCredits"],
        memberType: json["MemberType"],
        msisdn: json["Msisdn"],
      );

  Map<String, dynamic> toMap() => {
        "CurrentCredits": currentCredits,
        "MemberType": memberType,
        "Msisdn": msisdn,
      };

  @override
  List<Object> get props => [currentCredits, memberType, msisdn];
}
