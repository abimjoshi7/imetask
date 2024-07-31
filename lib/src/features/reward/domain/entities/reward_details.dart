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

  @override
  List<Object> get props => [currentCredits, memberType, msisdn];
}

extension RewardDetailsX on RewardDetails {
  Map<String, dynamic> toMap() => {
        "CurrentCredits": currentCredits,
        "MemberType": memberType,
        "Msisdn": msisdn,
      };
}
