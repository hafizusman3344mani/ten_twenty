part of 'watch_cubit.dart';

enum WatchStatus {
  initial,
  loading,
  success,
  error,
}

class WatchState {
  final WatchStatus status;
  final String errorMessage;
  final List<DummyVideoModel> videos;

  const WatchState(
      {required this.status, this.errorMessage = '', required this.videos});

  factory WatchState.initial() {
    return WatchState(status: WatchStatus.initial, videos: [

      DummyVideoModel(name: 'Comedies', imagePath: 'assets/png/comedies.png'),
      DummyVideoModel(name: 'Crime', imagePath: 'assets/png/crime.png'),
      DummyVideoModel(name: 'Family', imagePath: 'assets/png/family.png'),
      DummyVideoModel(name: 'Documentaries', imagePath: 'assets/png/documentaries.png'),
      DummyVideoModel(name: 'Dramas', imagePath: 'assets/png/dramas.png'),
      DummyVideoModel(name: 'Fantasy', imagePath: 'assets/png/fantasy.png'),
      DummyVideoModel(name: 'Holidays', imagePath: 'assets/png/holidays.png'),
      DummyVideoModel(name: 'Horror', imagePath: 'assets/png/horror.png'),
      DummyVideoModel(name: 'Sci-Fi', imagePath: 'assets/png/sci.png'),
      DummyVideoModel(name: 'Thriller', imagePath: 'assets/png/thriller.png'),
      DummyVideoModel(name: 'Timless', imagePath: 'assets/png/timeless.png'),
      DummyVideoModel(name: 'In time', imagePath: 'assets/png/in_time.png'),
      DummyVideoModel(name: 'A time to kill', imagePath: 'assets/png/time_to_kill.png'),
    ]);
  }

  WatchState copyWith({
    WatchStatus? status,
    String? errorMessage,
    List<DummyVideoModel>? videos,
  }) {
    return WatchState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? '',
        videos: videos ?? this.videos);
  }
}
