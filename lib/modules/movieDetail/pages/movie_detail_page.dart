import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty/utils/extended_context.dart';
import 'dart:math';

import '../../../constants/api_endpoints.dart';
import '../../../core/di/service_locator.dart';
import '../cubit/movie_detail_cubit.dart';

class MovieDetailPage extends StatelessWidget {
  final String movieId;
  const MovieDetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailCubit(movieDetailRepository: sl())
        ..getMovieDetail(movieId),
      child: const MovieDetailPageView(),
    );
  }
}

class MovieDetailPageView extends StatefulWidget {
  const MovieDetailPageView({super.key});

  @override
  State<MovieDetailPageView> createState() => _MovieDetailPageViewState();
}

class _MovieDetailPageViewState extends State<MovieDetailPageView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          return CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              expandedHeight: size.height * .5,
              floating: false,
              pinned: true,
              iconTheme: const IconThemeData(color: Colors.white),
              titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white),
              title: Text(
                context.localization.watch,
              ),
              flexibleSpace: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        "${Endpoints.imageUrl}${state.detailModel!.posterPath}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.localization.genres,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: List.generate(
                          state.detailModel!.genres.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Chip(
                                    backgroundColor: getRandomColor(),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        side: const BorderSide(color: Colors.transparent)),
                                    label: Text(
                                      state.detailModel!.genres[index].name,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                              )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      context.localization.overview,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      state.detailModel!.overview,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF8F8F8F)),
                    ),
                  ],
                ),
              ),
            ),
          ]);

        },
      ),
    );
  }

  Color getRandomColor() {
    final Random random = Random();

    int red = 100 + random.nextInt(56);
    int green = 100 + random.nextInt(56);
    int blue = 100 + random.nextInt(56);

    return Color.fromRGBO(red, green, blue, 1.0);
  }
}
