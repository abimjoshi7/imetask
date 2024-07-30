import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  final String profileImage;
  final DateTime dob;
  final bool isEmailVerified;
  final String dobDateFormat;
  final String msisdn;
  final String accCode;
  final String kycApproved;
  final String userType;
  final bool isNomineeAdded;
  final String checkUpdate;
  final bool isPinSet;
  final bool isRaffle;
  final String nfcCardNo;
  final String userFullName;
  final bool isSahayatri;
  final String qrPayload;
  final String gender;
  final String email;
  final bool isSahayatriEnabled;
  final String walletType;

  const UserInfo({
    required this.profileImage,
    required this.dob,
    required this.isEmailVerified,
    required this.dobDateFormat,
    required this.msisdn,
    required this.accCode,
    required this.kycApproved,
    required this.userType,
    required this.isNomineeAdded,
    required this.checkUpdate,
    required this.isPinSet,
    required this.isRaffle,
    required this.nfcCardNo,
    required this.userFullName,
    required this.isSahayatri,
    required this.qrPayload,
    required this.gender,
    required this.email,
    required this.isSahayatriEnabled,
    required this.walletType,
  });

  factory UserInfo.fromMap(Map<String, dynamic> mapItem) => UserInfo(
        profileImage: mapItem["ProfileImage"],
        dob: DateTime.parse(mapItem["Dob"]),
        isEmailVerified: mapItem["IsEmailVerified"],
        dobDateFormat: mapItem["DobDateFormat"],
        msisdn: mapItem["Msisdn"],
        accCode: mapItem["AccCode"],
        kycApproved: mapItem["KYCApproved"],
        userType: mapItem["UserType"],
        isNomineeAdded: mapItem["IsNomineeAdded"],
        checkUpdate: mapItem["CheckUpdate"],
        isPinSet: mapItem["IsPinSet"],
        isRaffle: mapItem["IsRaffle"],
        nfcCardNo: mapItem["NfcCardNo"],
        userFullName: mapItem["UserFullName"],
        isSahayatri: mapItem["IsSahayatri"],
        qrPayload: mapItem["QrPayload"],
        gender: mapItem["Gender"],
        email: mapItem["Email"],
        isSahayatriEnabled: mapItem["IsSahayatriEnabled"],
        walletType: mapItem["WalletType"],
      );

  Map<String, dynamic> toMap() => {
        "ProfileImage": profileImage,
        "Dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "IsEmailVerified": isEmailVerified,
        "DobDateFormat": dobDateFormat,
        "Msisdn": msisdn,
        "AccCode": accCode,
        "KYCApproved": kycApproved,
        "UserType": userType,
        "IsNomineeAdded": isNomineeAdded,
        "CheckUpdate": checkUpdate,
        "IsPinSet": isPinSet,
        "IsRaffle": isRaffle,
        "NfcCardNo": nfcCardNo,
        "UserFullName": userFullName,
        "IsSahayatri": isSahayatri,
        "QrPayload": qrPayload,
        "Gender": gender,
        "Email": email,
        "IsSahayatriEnabled": isSahayatriEnabled,
        "WalletType": walletType,
      };

  @override
  List<Object> get props {
    return [
      profileImage,
      dob,
      isEmailVerified,
      dobDateFormat,
      msisdn,
      accCode,
      kycApproved,
      userType,
      isNomineeAdded,
      checkUpdate,
      isPinSet,
      isRaffle,
      nfcCardNo,
      userFullName,
      isSahayatri,
      qrPayload,
      gender,
      email,
      isSahayatriEnabled,
      walletType,
    ];
  }
}
