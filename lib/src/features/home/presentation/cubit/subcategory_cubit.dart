import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' show unit;

import 'package:imepay/src/features/features.dart';

part 'subcategory_state.dart';

class SubcategoryCubit extends Cubit<SubCategoryState> {
  SubcategoryCubit(
    GetSubCategoryUsecase getSubCategoryUsecase,
  )   : _getSubCategoryUsecase = getSubCategoryUsecase,
        super(SubCategoryInitial());

  final GetSubCategoryUsecase _getSubCategoryUsecase;

  Future<void> fetchSubCategories() async {
    emit(SubCategoryLoading());
    return _getSubCategoryUsecase.call(unit).run().then(
          (value) => value.fold(
            (l) => emit(
              SubCategoryFailure(
                l,
              ),
            ),
            (r) => emit(
              SubCategorySuccess(
                subCategories: r,
              ),
            ),
          ),
        );
  }

  List<SubMenuItem> getSubCategoriesById(int id) => switch (state) {
        SubCategorySuccess(:final subCategories) => subCategories
            .where(
              (element) => element.menuItemId == id,
            )
            .toList(),
        _ => []
      };
}
