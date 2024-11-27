import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty/modules/home/models/home_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.initial());
  List<DummyVideoModel> searchedVideos = [];
  List<DummyVideoModel> allVideos = [];

  void getAllVideos() {
    allVideos = state.videos;
    emit(state.copyWith(videos: allVideos, status: SearchStatus.success));
  }

  void searchVideo(String query) {
    emit(state.copyWith(status: SearchStatus.loading));

    if (query.isNotEmpty) {
      searchedVideos = allVideos
          .where(
              (video) => video.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(state.copyWith(
          videos: searchedVideos,
          status: SearchStatus.success,
          searchedResult: searchedVideos.length));
    } else {
      emit(state.copyWith(videos: allVideos, status: SearchStatus.success));
    }
  }
}
