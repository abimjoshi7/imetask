part of 'wallet_cubit.dart';

sealed class WalletState extends Equatable {
  const WalletState();
}

final class WalletInitial extends WalletState {
  @override
  List<Object> get props => [];
}

final class WalletLoading extends WalletState {
  @override
  List<Object> get props => [];
}

final class WalletSuccess extends WalletState {
  final List<WalletDetails> walletDetails;
  final WalletDetails? walletDetailById;

  const WalletSuccess({
    this.walletDetails = const [],
    this.walletDetailById,
  });
  @override
  List<Object?> get props => [walletDetails, walletDetailById];
}

final class WalletFailure extends WalletState {
  final String? errorMsg;

  const WalletFailure(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
