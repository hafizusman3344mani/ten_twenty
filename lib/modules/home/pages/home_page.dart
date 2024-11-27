import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty/modules/home/cubit/home_cubit.dart';
import 'package:ten_twenty/modules/home/widgets/home_video_widget.dart';
import 'package:ten_twenty/modules/movieDetail/pages/movie_detail_page.dart';
import 'package:ten_twenty/utils/extended_context.dart';

import '../../../core/di/service_locator.dart';
import '../models/home_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(homeRepository: sl())..getUpcomingVideos(),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.localization.upcomingMovies),
          ),
          body: state.status == HomeStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state.status == HomeStatus.error
                  ? Center(
                      child: Text(state.errorMessage),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 16),
                      itemCount: state.response.results.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                      itemBuilder: (context, index) {
                        VideoModel videoModel = state.response.results[index];
                        return HomeVideoWidget(
                          videoModel: videoModel,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MovieDetailPage(
                                        movieId: videoModel.id.toString())));
                          },
                        );
                      }),
        );
      },
    );
  }
}
