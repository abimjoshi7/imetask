import 'package:equatable/equatable.dart';

class WalletDetails extends Equatable {
  final String memberType;
  final String amount;
  final String interestAmount;
  final String totalCreditPoints;
  final DateTime interestDate;

  const WalletDetails({
    required this.memberType,
    required this.amount,
    required this.interestAmount,
    required this.totalCreditPoints,
    required this.interestDate,
  });

  @override
  List<Object> get props {
    return [
      memberType,
      amount,
      interestAmount,
      totalCreditPoints,
      interestDate,
    ];
  }
}

extension WalletDetailsX on WalletDetails {
  Map<String, dynamic> toMap() {
    return {
      "MemberType": memberType,
      "Amount": amount,
      "InterestAmount": interestAmount,
      "TotalCreditPoints": totalCreditPoints,
      "InterestDate":
          "${interestDate.year.toString().padLeft(4, '0')}-${interestDate.month.toString().padLeft(2, '0')}-${interestDate.day.toString().padLeft(2, '0')}",
    };
  }
}
