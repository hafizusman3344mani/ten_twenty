import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty/modules/movieDetail/models/movie_detail_model.dart';

import '../../../../core/exceptions/api_error.dart';
import '../repository/movie_detail_repository.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final MovieDetailRepository _movieDetailRepository;

  MovieDetailCubit({required MovieDetailRepository movieDetailRepository})
      : _movieDetailRepository = movieDetailRepository,
        super(MovieDetailState.initial());

  Future<void> getMovieDetail(String movieId) async {
    emit(state.copyWith(status: MovieDetailStatus.loading));

    try {
      MovieDetailModel movieDetailModel =
          await _movieDetailRepository.getMovieDetail(movieId);
      emit(state.copyWith(
          status: MovieDetailStatus.success, detailModel: movieDetailModel));
    } on ApiError catch (e) {
      emit(state.copyWith(
          status: MovieDetailStatus.error, errorMessage: e.message));
    }
  }
}
