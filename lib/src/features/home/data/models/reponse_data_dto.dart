import 'package:equatable/equatable.dart';
import 'package:imepay/src/features/features.dart';

class ResponseDataDTO extends Equatable {
  final WalletDetailsDTO walletDetails;
  final RewardDetailsDTO rewardDetails;
  final UserDetailsDTO userInfo;
  final MenuDetailsDTO menuDetails;

  const ResponseDataDTO({
    required this.walletDetails,
    required this.rewardDetails,
    required this.userInfo,
    required this.menuDetails,
  });

  factory ResponseDataDTO.fromJson(Map<String, dynamic> json) =>
      ResponseDataDTO(
        walletDetails: WalletDetailsDTO.fromJson(json["WalletDetails"]),
        rewardDetails: RewardDetailsDTO.fromJson(json["RewardDetails"]),
        userInfo: UserDetailsDTO.fromJson(json["UserInfo"]),
        menuDetails: MenuDetailsDTO.fromJson(json["MenuDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "WalletDetails": walletDetails.toJson(),
        "RewardDetails": rewardDetails.toJson(),
        "UserInfo": userInfo.toJson(),
        "MenuDetails": menuDetails.toJson(),
      };

  @override
  List<Object> get props =>
      [walletDetails, rewardDetails, userInfo, menuDetails];
}
