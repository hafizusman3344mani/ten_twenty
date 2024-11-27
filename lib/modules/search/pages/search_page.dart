import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty/modules/home/models/home_model.dart';
import 'package:ten_twenty/modules/search/widgets/found_result_widget.dart';
import 'package:ten_twenty/modules/search/widgets/video_searched_result_widget.dart';
import 'package:ten_twenty/utils/extensions/extended_context.dart';

import '../../../widgets/search_textfield.dart';
import '../cubit/search_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()..getAllVideos(),
      child: const SearchPageView(),
    );
  }
}

class SearchPageView extends StatefulWidget {
  const SearchPageView({super.key});

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: SearchTextField(
                hintText: context.localization.tvShowsMoviesAndMore,
                controller: _searchController,
                onChanged: (v) =>
                    context.read<SearchCubit>().searchVideo(v ?? ''),
                onClear: () {
                  context.read<SearchCubit>().searchVideo('');
                  _searchController.clear();
                },
              ),
            ),
          ),
          body: state.status == SearchStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state.status == SearchStatus.error
                  ? Center(
                      child: Text(state.errorMessage),
                    )
                  : Column(
                      children: [
                        if (state.searchedResults > 0)
                          FoundResultWidget(
                              foundResults: state.searchedResults),
                        Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              itemCount: state.videos.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 16,
                                );
                              },
                              itemBuilder: (context, index) {
                                DummyVideoModel videoModel = state.videos[index];
                                return VideoSearchedResultWidget(
                                  videoModel: videoModel,
                                );
                              }),
                        ),
                      ],
                    ),
        );
      },
    );
  }
}
