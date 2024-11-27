import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty/modules/home/models/home_model.dart';
import 'package:ten_twenty/modules/home/respository/home_repository.dart';

import '../../../core/exceptions/api_error.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  HomeCubit({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(HomeState.initial());

  Future<void> getUpcomingVideos() async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      VideoModelResponse videoModelResponse =
          await _homeRepository.upComingVideos();
      emit(state.copyWith(
          status: HomeStatus.success, response: videoModelResponse));
    } on ApiError catch (e) {
      emit(state.copyWith(status: HomeStatus.error, errorMessage: e.message));
    }
  }
}
