import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' show unit;

import 'package:imepay/src/features/features.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(
    GetCategoryUsecase getCategoryUsecase,
  )   : _getCategoryUsecase = getCategoryUsecase,
        super(CategoryInitial());

  final GetCategoryUsecase _getCategoryUsecase;

  Future<void> fetchCategories() async {
    emit(CategoryLoading());
    return _getCategoryUsecase.call(unit).run().then(
          (value) => value.fold(
            (l) => emit(
              CategoryFailure(
                l,
              ),
            ),
            (r) => emit(
              CategorySuccess(
                categoryItems: r,
              ),
            ),
          ),
        );
  }

  List<MenuItem> getCategoriesById(int id) => switch (state) {
        CategorySuccess(:final categoryItems) => categoryItems
            .where(
              (element) => element.homeMenuId == id,
            )
            .toList(),
        _ => []
      };
}
