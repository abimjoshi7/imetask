import 'package:floor/floor.dart';
import 'package:imepay/src/features/profile/domain/domain.dart';

@Entity(tableName: 'User')
class UserDetailsDTO extends UserDetails {
  @primaryKey
  final int id;

  const UserDetailsDTO({
    required super.profileImage,
    required super.dob,
    required super.isEmailVerified,
    required super.dobDateFormat,
    required super.msisdn,
    required super.accCode,
    required super.kycApproved,
    required super.userType,
    required super.isNomineeAdded,
    required super.checkUpdate,
    required super.isPinSet,
    required super.isRaffle,
    required super.nfcCardNo,
    required super.userFullName,
    required super.isSahayatri,
    required super.qrPayload,
    required super.gender,
    required super.email,
    required super.isSahayatriEnabled,
    required super.walletType,
    this.id = 1,
  });

  factory UserDetailsDTO.fromJson(Map<String, dynamic> json) => UserDetailsDTO(
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
      id,
    ];
  }
}
