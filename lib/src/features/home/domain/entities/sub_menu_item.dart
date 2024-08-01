import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import 'menu_item.dart';

@Entity(indices: [
  Index(value: ['title'], unique: true)
])
class SubMenuItem extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int menuItemId;
  final String title;
  final String titleEng;
  final String icon;
  final String redirectionType;
  final String redirectionModule;
  final String redirectionValue;
  final int displayOrder;
  final bool isDisabled;
  final String disableMsg;
  final String promotionalTxt;

  @ForeignKey(
      entity: MenuItem, parentColumns: ['id'], childColumns: ['menuItemId'])
  const SubMenuItem({
    this.id,
    required this.menuItemId,
    required this.title,
    required this.titleEng,
    required this.icon,
    required this.redirectionType,
    required this.redirectionModule,
    required this.redirectionValue,
    required this.displayOrder,
    required this.isDisabled,
    required this.disableMsg,
    required this.promotionalTxt,
  });

  @override
  List<Object> get props {
    return [
      id ?? 0,
      menuItemId,
      title,
      titleEng,
      icon,
      redirectionType,
      redirectionModule,
      redirectionValue,
      displayOrder,
      isDisabled,
      disableMsg,
      promotionalTxt,
    ];
  }

  @override
  String toString() {
    return 'SubMenuItem(id: $id, menuItemId: $menuItemId, title: $title, titleEng: $titleEng, icon: $icon, redirectionType: $redirectionType, redirectionModule: $redirectionModule, redirectionValue: $redirectionValue, displayOrder: $displayOrder, isDisabled: $isDisabled, disableMsg: $disableMsg, promotionalTxt: $promotionalTxt)';
  }
}
