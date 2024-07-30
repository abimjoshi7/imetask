import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:imepay/src/features/features.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getInitialDataUsecase) : super(HomeInitial());

  final GetInitialDataUsecase _getInitialDataUsecase;

  Future<void> fetchInitialData() async {
    emit(HomeLoading());
    return _getInitialDataUsecase.call(unit).run().then(
          (value) => value.fold(
            (l) => emit(
              HomeFailure(
                l,
              ),
            ),
            (r) => emit(
              HomeSuccess(r),
            ),
          ),
        );
  }
}
