import 'package:equatable/equatable.dart';

class UserInfoDTO extends Equatable {
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

  const UserInfoDTO({
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

  factory UserInfoDTO.fromJson(Map<String, dynamic> json) => UserInfoDTO(
        profileImage: json["ProfileImage"],
        dob: DateTime.parse(json["Dob"]),
        isEmailVerified: json["IsEmailVerified"],
        dobDateFormat: json["DobDateFormat"],
        msisdn: json["Msisdn"],
        accCode: json["AccCode"],
        kycApproved: json["KYCApproved"],
        userType: json["UserType"],
        isNomineeAdded: json["IsNomineeAdded"],
        checkUpdate: json["CheckUpdate"],
        isPinSet: json["IsPinSet"],
        isRaffle: json["IsRaffle"],
        nfcCardNo: json["NfcCardNo"],
        userFullName: json["UserFullName"],
        isSahayatri: json["IsSahayatri"],
        qrPayload: json["QrPayload"],
        gender: json["Gender"],
        email: json["Email"],
        isSahayatriEnabled: json["IsSahayatriEnabled"],
        walletType: json["WalletType"],
      );

  Map<String, dynamic> toJson() => {
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
