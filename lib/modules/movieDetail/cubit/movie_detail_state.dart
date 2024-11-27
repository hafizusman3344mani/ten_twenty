part of 'movie_detail_cubit.dart';

enum MovieDetailStatus {
  initial,
  loading,
  success,
  error,
}

class MovieDetailState {
  final MovieDetailStatus status;
  final String errorMessage;
  final MovieDetailModel? detailModel;

  const MovieDetailState(
      {required this.status, this.errorMessage = '', this.detailModel});

  factory MovieDetailState.initial() {
    return const MovieDetailState(
      status: MovieDetailStatus.initial,
    );
  }

  MovieDetailState copyWith(
      {MovieDetailStatus? status,
      String? errorMessage,
      MovieDetailModel? detailModel}) {
    return MovieDetailState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? '',
        detailModel: detailModel ?? this.detailModel);
  }
}
