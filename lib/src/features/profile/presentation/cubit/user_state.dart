part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();
}

final class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

final class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

final class UserSuccess extends UserState {
  final List<UserDetails> userDetails;
  final UserDetails? userDetailById;

  const UserSuccess({
    this.userDetails = const [],
    this.userDetailById,
  });
  @override
  List<Object?> get props => [userDetails, userDetailById];
}

final class UserFailure extends UserState {
  final String? errorMsg;

  const UserFailure(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
