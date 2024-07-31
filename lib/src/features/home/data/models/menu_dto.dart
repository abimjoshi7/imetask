import 'package:equatable/equatable.dart';
import 'package:imepay/src/features/home/data/models/category_content_dto.dart';

class MenuDTO extends Equatable {
  final List<CategoryContentDTO> categoryContent;
  final String promotionalTxt;
  final String categoryTitleEng;
  final String categoryTitle;
  final int categoryTheme;
  final int displayOrder;

  const MenuDTO({
    required this.categoryContent,
    required this.promotionalTxt,
    required this.categoryTitleEng,
    required this.categoryTitle,
    required this.categoryTheme,
    required this.displayOrder,
  });

  factory MenuDTO.fromJson(Map<String, dynamic> json) => MenuDTO(
        categoryContent: List<CategoryContentDTO>.from(
            json["CategoryContent"].map((x) => CategoryContentDTO.fromJson(x))),
        promotionalTxt: json["PromotionalTxt"],
        categoryTitleEng: json["CategoryTitleEng"],
        categoryTitle: json["CategoryTitle"],
        categoryTheme: json["CategoryTheme"],
        displayOrder: json["DisplayOrder"],
      );

  Map<String, dynamic> toJson() => {
        "CategoryContent":
            List<dynamic>.from(categoryContent.map((x) => x.toJson())),
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
