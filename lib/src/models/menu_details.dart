import 'package:equatable/equatable.dart';

import 'package:imepay/src/models/menu.dart';

class MenuDetails extends Equatable {
  final List<Menu> homeMenu;
  final Menu footerMenu;
  final Menu headerMenu;

  const MenuDetails({
    required this.homeMenu,
    required this.footerMenu,
    required this.headerMenu,
  });

  factory MenuDetails.fromMap(Map<String, dynamic> json) => MenuDetails(
        homeMenu: List<Menu>.from(json["HomeMenu"].map((x) => Menu.fromMap(x))),
        footerMenu: Menu.fromMap(json["FooterMenu"]),
        headerMenu: Menu.fromMap(json["HeaderMenu"]),
      );

  Map<String, dynamic> toMap() => {
        "HomeMenu": List<dynamic>.from(homeMenu.map((x) => x.toMap())),
        "FooterMenu": footerMenu.toMap(),
        "HeaderMenu": headerMenu.toMap(),
      };

  @override
  List<Object> get props => [homeMenu, footerMenu, headerMenu];
}
