part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeSuccess extends HomeState {
  final BaseResponseDTO data;

  HomeSuccess(this.data);
  @override
  List<Object> get props => [data];
}

final class HomeFailure extends HomeState {
  final String? errorMsg;

  HomeFailure(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
