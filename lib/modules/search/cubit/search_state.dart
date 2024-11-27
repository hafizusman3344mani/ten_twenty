part of 'search_cubit.dart';

enum SearchStatus {
  initial,
  loading,
  success,
  error,
}

class SearchState {
  final SearchStatus status;
  final String errorMessage;
  final List<DummyVideoModel> videos;
  final int searchedResults;

  const SearchState(
      {required this.status, this.errorMessage = '', required this.videos,this.searchedResults = 0});

  factory SearchState.initial() {
    return SearchState(status: SearchStatus.initial, videos: [
      DummyVideoModel(name: 'Free Guy', imagePath: 'assets/png/free_guy.png'),
      DummyVideoModel(name: 'The King\'s Man', imagePath: 'assets/png/kings_man.png'),
      DummyVideoModel(name: 'Jojo Rabbit', imagePath: 'assets/png/jojo_rabit.png'),
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

  SearchState copyWith({
    SearchStatus? status,
    String? errorMessage,
    List<DummyVideoModel>? videos,
    int? searchedResult
  }) {
    return SearchState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? '',
        videos: videos ?? this.videos,searchedResults: searchedResult??0);
  }
}
