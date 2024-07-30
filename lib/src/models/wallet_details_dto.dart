// import 'package:equatable/equatable.dart';

// class WalletDetailsDTO extends Equatable {
//   final String memberType;
//   final String amount;
//   final String interestAmount;
//   final String totalCreditPoints;
//   final DateTime interestDate;
//   final String? status;

//   const WalletDetailsDTO({
//     required this.memberType,
//     required this.amount,
//     required this.interestAmount,
//     required this.totalCreditPoints,
//     required this.interestDate,
//     this.status,
//   });

//   factory WalletDetailsDTO.fromJson(Map<String, dynamic> json) =>
//       WalletDetailsDTO(
//         memberType: json["MemberType"],
//         amount: json["Amount"],
//         interestAmount: json["InterestAmount"],
//         totalCreditPoints: json["TotalCreditPoints"],
//         interestDate: DateTime.parse(json["InterestDate"]),
//         status: json["Status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "MemberType": memberType,
//         "Amount": amount,
//         "InterestAmount": interestAmount,
//         "TotalCreditPoints": totalCreditPoints,
//         "InterestDate":
//             "${interestDate.year.toString().padLeft(4, '0')}-${interestDate.month.toString().padLeft(2, '0')}-${interestDate.day.toString().padLeft(2, '0')}",
//         "Status": status,
//       };

//   @override
//   List<Object?> get props {
//     return [
//       memberType,
//       amount,
//       interestAmount,
//       totalCreditPoints,
//       interestDate,
//       status,
//     ];
//   }
// }
