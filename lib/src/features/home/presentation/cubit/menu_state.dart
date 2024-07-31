part of 'menu_cubit.dart';

sealed class MenuState extends Equatable {
  const MenuState();
}

final class MenuInitial extends MenuState {
  @override
  List<Object> get props => [];
}

final class MenuLoading extends MenuState {
  @override
  List<Object> get props => [];
}

final class MenuSuccess extends MenuState {
  final List<MenuItem> categoryItems;
  final List<SubMenuItem> subMenuItems;
  final List<HomeMenu> menuItems;

  const MenuSuccess({
    required this.categoryItems,
    required this.subMenuItems,
    required this.menuItems,
  });

  @override
  List<Object> get props => [categoryItems, subMenuItems, menuItems];
}

final class MenuFailure extends MenuState {
  final String? errorMsg;

  const MenuFailure(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
