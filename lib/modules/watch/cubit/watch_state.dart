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
  final List<VideoModel> videos;

  const WatchState(
      {required this.status, this.errorMessage = '', required this.videos});

  factory WatchState.initial() {
    return WatchState(status: WatchStatus.initial, videos: [

      VideoModel(name: 'Comedies', imagePath: 'assets/png/comedies.png'),
      VideoModel(name: 'Crime', imagePath: 'assets/png/crime.png'),
      VideoModel(name: 'Family', imagePath: 'assets/png/family.png'),
      VideoModel(name: 'Documentaries', imagePath: 'assets/png/documentaries.png'),
      VideoModel(name: 'Dramas', imagePath: 'assets/png/dramas.png'),
      VideoModel(name: 'Fantasy', imagePath: 'assets/png/fantasy.png'),
      VideoModel(name: 'Holidays', imagePath: 'assets/png/holidays.png'),
      VideoModel(name: 'Horror', imagePath: 'assets/png/horror.png'),
      VideoModel(name: 'Sci-Fi', imagePath: 'assets/png/sci.png'),
      VideoModel(name: 'Thriller', imagePath: 'assets/png/thriller.png'),
      VideoModel(name: 'Timless', imagePath: 'assets/png/timeless.png'),
      VideoModel(name: 'In time', imagePath: 'assets/png/in_time.png'),
      VideoModel(name: 'A time to kill', imagePath: 'assets/png/time_to_kill.png'),
    ]);
  }

  WatchState copyWith({
    WatchStatus? status,
    String? errorMessage,
    List<VideoModel>? videos,
  }) {
    return WatchState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? '',
        videos: videos ?? this.videos);
  }
}
