import 'package:floor/floor.dart';
import 'package:imepay/src/features/wallet/domain/entities/wallet_details.dart';

@Entity(tableName: 'Wallet')
class WalletDetailsDTO extends WalletDetails {
  const WalletDetailsDTO({
    required super.amount,
    required super.interestAmount,
    required super.totalCreditPoints,
    required super.interestDate,
    required super.memberType,
    required super.status,
    this.id = 1,
  });

  @PrimaryKey()
  final int id;

  factory WalletDetailsDTO.fromJson(Map<String, dynamic> json) =>
      WalletDetailsDTO(
        memberType: json["MemberType"],
        amount: json["Amount"],
        interestAmount: json["InterestAmount"],
        totalCreditPoints: json["TotalCreditPoints"],
        interestDate: DateTime.parse(json["InterestDate"]),
        status: json["Status"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "MemberType": memberType,
        "Amount": amount,
        "InterestAmount": interestAmount,
        "TotalCreditPoints": totalCreditPoints,
        "InterestDate":
            "${interestDate.year.toString().padLeft(4, '0')}-${interestDate.month.toString().padLeft(2, '0')}-${interestDate.day.toString().padLeft(2, '0')}",
        "Status": status,
        "id": id,
      };

  @override
  List<Object?> get props {
    return [
      memberType,
      amount,
      interestAmount,
      totalCreditPoints,
      interestDate,
      status,
      id,
    ];
  }
}
