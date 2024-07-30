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
