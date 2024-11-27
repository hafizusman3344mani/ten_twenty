part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState {
  final HomeStatus status;
  final String errorMessage;
  final VideoModelResponse response;

  const HomeState(
      {required this.status, this.errorMessage = '', required this.response});

  factory HomeState.initial() {
    return HomeState(
        status: HomeStatus.initial,
        response: VideoModelResponse(
            dates: Dates(maximum: DateTime.now(), minimum: DateTime.now()),
            page: 0,
            results: [],
            totalPages: 0,
            totalResults: 0));
  }

  HomeState copyWith({
    HomeStatus? status,
    String? errorMessage,
    VideoModelResponse? response,
  }) {
    return HomeState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? '',
        response: response ?? this.response);
  }
}
