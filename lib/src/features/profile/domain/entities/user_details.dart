import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
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

  const UserDetails({
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

extension UserDetailsX on UserDetails {
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
}
