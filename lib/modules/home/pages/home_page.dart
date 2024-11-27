import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty/modules/home/cubit/home_cubit.dart';
import 'package:ten_twenty/modules/home/widgets/home_video_widget.dart';

import '../models/home_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: HomePageView(),
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
            title: Text('Home'),
          ),
          body: state.status == HomeStatus.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : state.status == HomeStatus.error
                  ? Center(
                      child: Text(state.errorMessage),
                    )
                  : ListView.separated(
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      itemCount: state.videos.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 16,
                        );
                      },
                      itemBuilder: (context, index) {
                        VideoModel videoModel = state.videos[index];
                        return HomeVideoWidget(videoModel);
                      }),
        );
      },
    );
  }
}
