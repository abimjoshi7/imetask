import 'package:equatable/equatable.dart';

import 'package:imepay/src/features/home/data/models/sub_category_dto.dart';

class CategoryContentDTO extends Equatable {
  final String promotionalTxt;
  final String redirectionValue;
  final String? btnIcon;
  final dynamic transactionId;
  final String? subTitle;
  final bool isDisabled;
  final String title;
  final String? btnLabel;
  final List<SubCategoryDTO>? subCategory;
  final String redirectionModule;
  final int displayOrder;
  final dynamic data;
  final String redirectionType;
  final String icon;
  final String? titleEng;
  final String disableMesg;

  const CategoryContentDTO({
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

  factory CategoryContentDTO.fromJson(Map<String, dynamic> json) =>
      CategoryContentDTO(
        promotionalTxt: json["PromotionalTxt"],
        redirectionValue: json["RedirectionValue"],
        btnIcon: json["BtnIcon"],
        transactionId: json["TransactionId"],
        subTitle: json["SubTitle"],
        isDisabled: json["IsDisabled"],
        title: json["Title"],
        btnLabel: json["BtnLabel"],
        subCategory: json["SubCategory"] == null
            ? []
            : List<SubCategoryDTO>.from(
                json["SubCategory"]!.map((x) => SubCategoryDTO.fromJson(x))),
        redirectionModule: json["RedirectionModule"],
        displayOrder: json["DisplayOrder"],
        data: json["Data"],
        redirectionType: json["RedirectionType"],
        icon: json["Icon"],
        titleEng: json["TitleEng"],
        disableMesg: json["DisableMesg"],
      );

  Map<String, dynamic> toJson() => {
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
            : List<dynamic>.from(subCategory!.map((x) => x.toJson())),
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
