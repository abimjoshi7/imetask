import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/domain.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required GetUserDetailUsecase getUserDetailUsecase,
    required GetUserDetailsUsecase getUserDetailsUsecase,
    required InsertUserDetailUsecase insertUserDetailUsecase,
  })  : _getUserDetailUsecase = getUserDetailUsecase,
        _getUserDetailsUsecase = getUserDetailsUsecase,
        _insertUserDetailUsecase = insertUserDetailUsecase,
        super(UserInitial());

  final GetUserDetailUsecase _getUserDetailUsecase;
  final GetUserDetailsUsecase _getUserDetailsUsecase;
  final InsertUserDetailUsecase _insertUserDetailUsecase;

  Future<void> getUserDetail(int id) async {
    emit(UserLoading());
    var userDetails = <UserDetails>[];
    if (state is UserSuccess) {
      userDetails.addAll((state as UserSuccess).userDetails);
    }
    final result = await _getUserDetailUsecase(id).run();
    result.fold(
      (l) => emit(UserFailure(l)),
      (r) => emit(
        UserSuccess(
          userDetails: userDetails,
          userDetailById: r,
        ),
      ),
    );
  }

  Future<void> getUserDetails() async {
    emit(UserLoading());
    final result = await _getUserDetailsUsecase(unit).run();
    result.fold(
      (l) => emit(UserFailure(l)),
      (r) => emit(UserSuccess(userDetails: r)),
    );
  }

  Future<void> insertUserDetail(UserDetails userDetails) async {
    emit(UserLoading());
    final result = await _insertUserDetailUsecase(userDetails).run();
    result.fold(
      (l) => emit(UserFailure(l)),
      (r) => emit(const UserSuccess()),
    );
  }
}
