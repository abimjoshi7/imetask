import 'package:equatable/equatable.dart';

import 'package:imepay/src/models/category_content.dart';

class Menu extends Equatable {
  final List<CategoryContent> categoryContent;
  final String promotionalTxt;
  final String categoryTitleEng;
  final String categoryTitle;
  final int categoryTheme;
  final int displayOrder;

  const Menu({
    required this.categoryContent,
    required this.promotionalTxt,
    required this.categoryTitleEng,
    required this.categoryTitle,
    required this.categoryTheme,
    required this.displayOrder,
  });

  factory Menu.fromMap(Map<String, dynamic> mapItem) => Menu(
        categoryContent: List<CategoryContent>.from(
            mapItem["CategoryContent"].map((x) => CategoryContent.fromMap(x))),
        promotionalTxt: mapItem["PromotionalTxt"],
        categoryTitleEng: mapItem["CategoryTitleEng"],
        categoryTitle: mapItem["CategoryTitle"],
        categoryTheme: mapItem["CategoryTheme"],
        displayOrder: mapItem["DisplayOrder"],
      );

  Map<String, dynamic> toMap() => {
        "CategoryContent":
            List<dynamic>.from(categoryContent.map((x) => x.toMap())),
        "PromotionalTxt": promotionalTxt,
        "CategoryTitleEng": categoryTitleEng,
        "CategoryTitle": categoryTitle,
        "CategoryTheme": categoryTheme,
        "DisplayOrder": displayOrder,
      };

  @override
  List<Object> get props {
    return [
      categoryContent,
      promotionalTxt,
      categoryTitleEng,
      categoryTitle,
      categoryTheme,
      displayOrder,
    ];
  }
}
