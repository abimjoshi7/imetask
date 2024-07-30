import 'package:equatable/equatable.dart';

class SubCategoryDTO extends Equatable {
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

  const SubCategoryDTO({
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

  factory SubCategoryDTO.fromJson(Map<String, dynamic> json) => SubCategoryDTO(
        disableMesg: json["DisableMesg"],
        promotionalTxt: json["PromotionalTxt"]!,
        redirectionModule: json["RedirectionModule"],
        isDisabled: json["IsDisabled"],
        titleEng: json["TitleEng"],
        redirectionType: json["RedirectionType"],
        redirectionValue: json["RedirectionValue"],
        displayOrder: json["DisplayOrder"],
        icon: json["Icon"],
        title: json["Title"],
      );

  Map<String, dynamic> toJson() => {
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
