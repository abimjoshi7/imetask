import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';

part 'reward_state.dart';

class RewardCubit extends Cubit<RewardState> {
  RewardCubit({
    required GetRewardDetailUsecase getRewardDetailUsecase,
    required GetRewardDetailsUsecase getRewardDetailsUsecase,
    required InsertRewardDetailUsecase insertRewardDetailUsecase,
  })  : _getRewardDetailUsecase = getRewardDetailUsecase,
        _getRewardDetailsUsecase = getRewardDetailsUsecase,
        _insertRewardDetailUsecase = insertRewardDetailUsecase,
        super(RewardInitial());

  final GetRewardDetailUsecase _getRewardDetailUsecase;
  final GetRewardDetailsUsecase _getRewardDetailsUsecase;
  final InsertRewardDetailUsecase _insertRewardDetailUsecase;

  Future<void> getRewardDetail(int id) async {
    var rewardDetails = <RewardDetails>[];
    if (state is RewardSuccess) {
      rewardDetails.addAll((state as RewardSuccess).rewardDetails);
    }
    emit(RewardLoading());
    final result = await _getRewardDetailUsecase(id).run();
    result.fold(
      (l) => emit(RewardFailure(l)),
      (r) => emit(
        RewardSuccess(
          rewardDetails: rewardDetails,
          rewardDetailById: r,
        ),
      ),
    );
  }

  Future<void> getRewardDetails() async {
    emit(RewardLoading());
    final result = await _getRewardDetailsUsecase(unit).run();
    result.fold(
      (l) => emit(RewardFailure(l)),
      (r) => emit(RewardSuccess(rewardDetails: r)),
    );
  }

  Future<void> insertRewardDetail(RewardDetails rewardDetails) async {
    emit(RewardLoading());
    final result = await _insertRewardDetailUsecase(rewardDetails).run();
    result.fold(
      (l) => emit(RewardFailure(l)),
      (_) => _,
    );
    await getRewardDetails();
  }
}
