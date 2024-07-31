import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import 'package:imepay/src/features/features.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit({
    required GetCategoryUsecase getCategoryUsecase,
    required GetSubCategoryUsecase getSubCategoryUsecase,
    required GetMenuUsecase getMenuUsecase,
  })  : _getCategoryUsecase = getCategoryUsecase,
        _getSubCategoryUsecase = getSubCategoryUsecase,
        _getMenuUsecase = getMenuUsecase,
        super(MenuInitial());

  final GetCategoryUsecase _getCategoryUsecase;
  final GetSubCategoryUsecase _getSubCategoryUsecase;
  final GetMenuUsecase _getMenuUsecase;

  Future<void> fetchMenu() async {
    var subMenus = <SubMenuItem>[];
    var categories = <MenuItem>[];

    if (state is MenuSuccess) {
      subMenus = (state as MenuSuccess).subMenuItems;
      categories = (state as MenuSuccess).categoryItems;
    }
    emit(MenuLoading());
    return _getMenuUsecase.call(unit).run().then(
          (value) => value.fold(
            (l) => emit(
              MenuFailure(
                l,
              ),
            ),
            (r) => emit(
              MenuSuccess(
                categoryItems: categories,
                subMenuItems: subMenus,
                menuItems: r,
              ),
            ),
          ),
        );
  }

  Future<void> fetchCategories() async {
    var subCategories = <SubMenuItem>[];
    var menus = <HomeMenu>[];
    if (state is MenuSuccess) {
      subCategories = (state as MenuSuccess).subMenuItems;
      menus = (state as MenuSuccess).menuItems;
    }
    emit(MenuLoading());
    return _getCategoryUsecase.call(unit).run().then(
          (value) => value.fold(
            (l) => emit(
              MenuFailure(
                l,
              ),
            ),
            (r) => emit(
              MenuSuccess(
                  categoryItems: r,
                  subMenuItems: subCategories,
                  menuItems: menus),
            ),
          ),
        );
  }

  Future<void> fetchSubCategories() async {
    var categories = <MenuItem>[];
    var menus = <HomeMenu>[];

    if (state is MenuSuccess) {
      categories = (state as MenuSuccess).categoryItems;
      menus = (state as MenuSuccess).menuItems;
    }
    emit(MenuLoading());
    return _getSubCategoryUsecase.call(unit).run().then(
          (value) => value.fold(
            (l) => emit(
              MenuFailure(
                l,
              ),
            ),
            (r) => emit(
              MenuSuccess(
                categoryItems: categories,
                subMenuItems: r,
                menuItems: menus,
              ),
            ),
          ),
        );
  }

  List<SubMenuItem> getSubCategoriesById(int id) {
    if (state is MenuSuccess) {
      return (state as MenuSuccess)
          .subMenuItems
          .where(
            (element) => element.menuItemId == id,
          )
          .toList();
    }
    return [];
  }

  List<MenuItem> getCategoriesById(int id) {
    if (state is MenuSuccess) {
      return (state as MenuSuccess)
          .categoryItems
          .where(
            (element) => element.homeMenuId == id,
          )
          .toList();
    }
    return [];
  }

  List<HomeMenu> getMenuById(int id) {
    if (state is MenuSuccess) {
      return (state as MenuSuccess)
          .menuItems
          .where(
            (element) => element.id == id,
          )
          .toList();
    }
    return [];
  }
}
