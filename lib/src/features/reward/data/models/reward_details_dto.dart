import 'package:floor/floor.dart';

import '../../domain/entities/entities.dart';

@Entity(tableName: 'Reward')
class RewardDetailsDTO extends RewardDetails {
  @primaryKey
  final int id;

  const RewardDetailsDTO({
    required super.currentCredits,
    required super.memberType,
    required super.msisdn,
    this.id = 1,
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
  List<Object> get props => [currentCredits, memberType, msisdn, id];
}
