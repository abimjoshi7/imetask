import 'package:equatable/equatable.dart';

import 'package:imepay/src/features/home/data/models/menu_dto.dart';

class MenuDetailsDTO extends Equatable {
  final List<MenuDTO> homeMenu;
  final MenuDTO footerMenu;
  final MenuDTO headerMenu;

  const MenuDetailsDTO({
    required this.homeMenu,
    required this.footerMenu,
    required this.headerMenu,
  });

  factory MenuDetailsDTO.fromJson(Map<String, dynamic> json) => MenuDetailsDTO(
        homeMenu: List<MenuDTO>.from(
            json["HomeMenu"].map((x) => MenuDTO.fromJson(x))),
        footerMenu: MenuDTO.fromJson(json["FooterMenu"]),
        headerMenu: MenuDTO.fromJson(json["HeaderMenu"]),
      );

  Map<String, dynamic> toJson() => {
        "HomeMenu": List<dynamic>.from(homeMenu.map((x) => x.toJson())),
        "FooterMenu": footerMenu.toJson(),
        "HeaderMenu": headerMenu.toJson(),
      };

  @override
  List<Object> get props => [homeMenu, footerMenu, headerMenu];
}
