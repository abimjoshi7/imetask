import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:imepay/src/features/features.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit({
    required GetWalletDetailUsecase getWalletDetailUsecase,
    required GetWalletDetailsUsecase getWalletDetailsUsecase,
    required InsertWalletDetailUsecase insertWalletDetailUsecase,
  })  : _getWalletDetailUsecase = getWalletDetailUsecase,
        _getWalletDetailsUsecase = getWalletDetailsUsecase,
        _insertWalletDetailUsecase = insertWalletDetailUsecase,
        super(WalletInitial());

  final GetWalletDetailUsecase _getWalletDetailUsecase;
  final GetWalletDetailsUsecase _getWalletDetailsUsecase;
  final InsertWalletDetailUsecase _insertWalletDetailUsecase;

  Future<void> getWalletDetail(int id) async {
    emit(WalletLoading());
    var walletDetails = <WalletDetails>[];
    if (state is WalletSuccess) {
      walletDetails.addAll((state as WalletSuccess).walletDetails);
    }
    final result = await _getWalletDetailUsecase(id).run();
    result.fold(
      (l) => emit(WalletFailure(l)),
      (r) => emit(
        WalletSuccess(
          walletDetails: walletDetails,
          walletDetailById: r,
        ),
      ),
    );
  }

  Future<void> getWalletDetails() async {
    emit(WalletLoading());
    final result = await _getWalletDetailsUsecase(unit).run();
    result.fold(
      (l) => emit(WalletFailure(l)),
      (r) => emit(WalletSuccess(walletDetails: r)),
    );
  }

  Future<void> insertWalletDetail(WalletDetails walletDetails) async {
    emit(WalletLoading());
    final result = await _insertWalletDetailUsecase(walletDetails).run();
    result.fold(
      (l) => emit(WalletFailure(l)),
      (r) => emit(const WalletSuccess()),
    );
  }
}
