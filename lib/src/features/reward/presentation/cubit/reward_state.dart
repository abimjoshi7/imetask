part of 'reward_cubit.dart';

sealed class RewardState extends Equatable {
  const RewardState();
}

final class RewardInitial extends RewardState {
  @override
  List<Object> get props => [];
}

final class RewardLoading extends RewardState {
  @override
  List<Object> get props => [];
}

final class RewardSuccess extends RewardState {
  final List<RewardDetails> rewardDetails;
  final RewardDetails? rewardDetailById;

  const RewardSuccess({
    this.rewardDetails = const [],
    this.rewardDetailById,
  });
  @override
  List<Object?> get props => [rewardDetails, rewardDetailById];
}

final class RewardFailure extends RewardState {
  final String? errorMsg;

  const RewardFailure(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
