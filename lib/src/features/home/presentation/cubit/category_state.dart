part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
}

final class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

final class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

final class CategorySuccess extends CategoryState {
  final List<MenuItem> categoryItems;

  const CategorySuccess({
    required this.categoryItems,
  });

  @override
  List<Object> get props => [categoryItems];
}

final class CategoryFailure extends CategoryState {
  final String? errorMsg;

  const CategoryFailure(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
