
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(indices: [
  Index(value: ['categoryTitle'], unique: true)
])
class HomeMenu extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String categoryTitleEng;
  final String categoryTitle;
  final int displayOrder;
  final int categoryTheme;
  final String promotionalTxt;

  const HomeMenu({
    required this.id,
    required this.categoryTitleEng,
    required this.categoryTitle,
    required this.displayOrder,
    required this.categoryTheme,
    required this.promotionalTxt,
  });

  @override
  String toString() {
    return 'HomeMenu(id: $id, categoryTitleEng: $categoryTitleEng, categoryTitle: $categoryTitle, displayOrder: $displayOrder, categoryTheme: $categoryTheme, promotionalTxt: $promotionalTxt)';
  }

  @override
  List<Object> get props {
    return [
      id,
      categoryTitleEng,
      categoryTitle,
      displayOrder,
      categoryTheme,
      promotionalTxt,
    ];
  }
}
