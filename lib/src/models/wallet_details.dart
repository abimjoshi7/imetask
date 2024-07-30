import 'package:equatable/equatable.dart';

class WalletDetails extends Equatable {
  final String memberType;
  final String amount;
  final String interestAmount;
  final String totalCreditPoints;
  final DateTime interestDate;
  final String? status;

  const WalletDetails({
    required this.memberType,
    required this.amount,
    required this.interestAmount,
    required this.totalCreditPoints,
    required this.interestDate,
    this.status,
  });

  factory WalletDetails.fromMap(Map<String, dynamic> mapItem) => WalletDetails(
        memberType: mapItem["MemberType"],
        amount: mapItem["Amount"],
        interestAmount: mapItem["InterestAmount"],
        totalCreditPoints: mapItem["TotalCreditPoints"],
        interestDate: DateTime.parse(mapItem["InterestDate"]),
        status: mapItem["Status"],
      );

  Map<String, dynamic> toMap() => {
        "MemberType": memberType,
        "Amount": amount,
        "InterestAmount": interestAmount,
        "TotalCreditPoints": totalCreditPoints,
        "InterestDate":
            "${interestDate.year.toString().padLeft(4, '0')}-${interestDate.month.toString().padLeft(2, '0')}-${interestDate.day.toString().padLeft(2, '0')}",
        "Status": status,
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
    ];
  }
}
