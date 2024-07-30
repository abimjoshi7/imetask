import 'package:equatable/equatable.dart';

import 'package:imepay/src/models/sub_category.dart';

class CategoryContent extends Equatable {
  final String promotionalTxt;
  final String redirectionValue;
  final String? btnIcon;
  final dynamic transactionId;
  final String? subTitle;
  final bool isDisabled;
  final String title;
  final String? btnLabel;
  final List<SubCategory>? subCategory;
  final String redirectionModule;
  final int displayOrder;
  final dynamic data;
  final String redirectionType;
  final String icon;
  final String? titleEng;
  final String disableMesg;

  const CategoryContent({
    required this.promotionalTxt,
    required this.redirectionValue,
    required this.btnIcon,
    required this.transactionId,
    required this.subTitle,
    required this.isDisabled,
    required this.title,
    required this.btnLabel,
    required this.subCategory,
    required this.redirectionModule,
    required this.displayOrder,
    required this.data,
    required this.redirectionType,
    required this.icon,
    required this.titleEng,
    required this.disableMesg,
  });

  factory CategoryContent.fromMap(Map<String, dynamic> mapItem) =>
      CategoryContent(
        promotionalTxt: mapItem["PromotionalTxt"],
        redirectionValue: mapItem["RedirectionValue"],
        btnIcon: mapItem["BtnIcon"],
        transactionId: mapItem["TransactionId"],
        subTitle: mapItem["SubTitle"],
        isDisabled: mapItem["IsDisabled"],
        title: mapItem["Title"],
        btnLabel: mapItem["BtnLabel"],
        subCategory: mapItem["SubCategory"] == null
            ? []
            : List<SubCategory>.from(
                mapItem["SubCategory"]!.map((x) => SubCategory.fromMap(x))),
        redirectionModule: mapItem["RedirectionModule"],
        displayOrder: mapItem["DisplayOrder"],
        data: mapItem["Data"],
        redirectionType: mapItem["RedirectionType"],
        icon: mapItem["Icon"],
        titleEng: mapItem["TitleEng"],
        disableMesg: mapItem["DisableMesg"],
      );

  Map<String, dynamic> toMap() => {
        "PromotionalTxt": promotionalTxt,
        "RedirectionValue": redirectionValue,
        "BtnIcon": btnIcon,
        "TransactionId": transactionId,
        "SubTitle": subTitle,
        "IsDisabled": isDisabled,
        "Title": title,
        "BtnLabel": btnLabel,
        "SubCategory": subCategory == null
            ? []
            : List<dynamic>.from(subCategory!.map((x) => x.toMap())),
        "RedirectionModule": redirectionModule,
        "DisplayOrder": displayOrder,
        "Data": data,
        "RedirectionType": redirectionType,
        "Icon": icon,
        "TitleEng": titleEng,
        "DisableMesg": disableMesg,
      };

  @override
  List<Object?> get props {
    return [
      promotionalTxt,
      redirectionValue,
      btnIcon,
      transactionId,
      subTitle,
      isDisabled,
      title,
      btnLabel,
      subCategory,
      redirectionModule,
      displayOrder,
      data,
      redirectionType,
      icon,
      titleEng,
      disableMesg,
    ];
  }
}
