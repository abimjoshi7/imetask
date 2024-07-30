import 'package:equatable/equatable.dart';

import 'package:imepay/src/models/menu_details.dart';
import 'package:imepay/src/models/reward_details.dart';
import 'package:imepay/src/models/user_info.dart';
import 'package:imepay/src/models/wallet_details.dart';

class ResponseData extends Equatable {
  final WalletDetails walletDetails;
  final RewardDetails rewardDetails;
  final UserInfo userInfo;
  final MenuDetails menuDetails;

  const ResponseData({
    required this.walletDetails,
    required this.rewardDetails,
    required this.userInfo,
    required this.menuDetails,
  });

  factory ResponseData.fromMap(Map<String, dynamic> mapItem) => ResponseData(
        walletDetails: WalletDetails.fromMap(mapItem["WalletDetails"]),
        rewardDetails: RewardDetails.fromMap(mapItem["RewardDetails"]),
        userInfo: UserInfo.fromMap(mapItem["UserInfo"]),
        menuDetails: MenuDetails.fromMap(mapItem["MenuDetails"]),
      );

  Map<String, dynamic> toMap() => {
        "WalletDetails": walletDetails.toMap(),
        "RewardDetails": rewardDetails.toMap(),
        "UserInfo": userInfo.toMap(),
        "MenuDetails": menuDetails.toMap(),
      };

  @override
  List<Object> get props =>
      [walletDetails, rewardDetails, userInfo, menuDetails];
}
