import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import 'package:imepay/src/features/features.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(
    GetMenuUsecase getMenuUsecase,
  )   : _getMenuUsecase = getMenuUsecase,
        super(MenuInitial());

  final GetMenuUsecase _getMenuUsecase;

  Future<void> fetchMenu() async {
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
                menuItems: r,
              ),
            ),
          ),
        );
  }

  List<HomeMenu> getMenuById(int id) => switch (state) {
        MenuSuccess(:final menuItems) => menuItems
            .where(
              (element) => element.id == id,
            )
            .toList(),
        _ => []
      };
}
