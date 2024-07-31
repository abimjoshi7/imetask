import 'package:equatable/equatable.dart';

class SubCategory extends Equatable {
  final String disableMsg;
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
    required this.disableMsg,
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

  // factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
  //       disableMsg: json["DisableMesg"],
  //       promotionalTxt: json["PromotionalTxt"]!,
  //       redirectionModule: json["RedirectionModule"],
  //       isDisabled: json["IsDisabled"],
  //       titleEng: json["TitleEng"],
  //       redirectionType: json["RedirectionType"],
  //       redirectionValue: json["RedirectionValue"],
  //       displayOrder: json["DisplayOrder"],
  //       icon: json["Icon"],
  //       title: json["Title"],
  //     );

  @override
  List<Object> get props {
    return [
      disableMsg,
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

extension SubCategoryX on SubCategory {
  Map<String, dynamic> toMap() => {
        "DisableMesg": disableMsg,
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
}
