part of 'subcategory_cubit.dart';

sealed class SubCategoryState extends Equatable {
  const SubCategoryState();
}

final class SubCategoryInitial extends SubCategoryState {
  @override
  List<Object> get props => [];
}

final class SubCategoryLoading extends SubCategoryState {
  @override
  List<Object> get props => [];
}

final class SubCategorySuccess extends SubCategoryState {
  final List<SubMenuItem> subCategories;

  const SubCategorySuccess({
    required this.subCategories,
  });

  @override
  List<Object> get props => [subCategories];
}

final class SubCategoryFailure extends SubCategoryState {
  final String? errorMsg;

  const SubCategoryFailure(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
