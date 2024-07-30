import 'package:equatable/equatable.dart';

class SubCategory extends Equatable {
  final String disableMesg;
  final String promotionalTxt;
  final String redirectionModule;
  final bool isDisabled;
  final String titleEng;
  final String redirectionType;
  final String redirectionValue;
  final int displayOrder;
  final String icon;
  final String title;

  const SubCategory({
    required this.disableMesg,
    required this.promotionalTxt,
    required this.redirectionModule,
    required this.isDisabled,
    required this.titleEng,
    required this.redirectionType,
    required this.redirectionValue,
    required this.displayOrder,
    required this.icon,
    required this.title,
  });

  factory SubCategory.fromMap(Map<String, dynamic> mapItem) => SubCategory(
        disableMesg: mapItem["DisableMesg"],
        promotionalTxt: mapItem["PromotionalTxt"]!,
        redirectionModule: mapItem["RedirectionModule"],
        isDisabled: mapItem["IsDisabled"],
        titleEng: mapItem["TitleEng"],
        redirectionType: mapItem["RedirectionType"],
        redirectionValue: mapItem["RedirectionValue"],
        displayOrder: mapItem["DisplayOrder"],
        icon: mapItem["Icon"],
        title: mapItem["Title"],
      );

  Map<String, dynamic> toMap() => {
        "DisableMesg": disableMesg,
        "PromotionalTxt": promotionalTxt,
        "RedirectionModule": redirectionModule,
        "IsDisabled": isDisabled,
        "TitleEng": titleEng,
        "RedirectionType": redirectionType,
        "RedirectionValue": redirectionValue,
        "DisplayOrder": displayOrder,
        "Icon": icon,
        "Title": title,
      };

  @override
  List<Object> get props {
    return [
      disableMesg,
      promotionalTxt,
      redirectionModule,
      isDisabled,
      titleEng,
      redirectionType,
      redirectionValue,
      displayOrder,
      icon,
      title,
    ];
  }
}
