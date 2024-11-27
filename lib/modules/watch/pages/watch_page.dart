import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty/modules/search/pages/search_page.dart';
import 'package:ten_twenty/utils/extended_context.dart';

import '../../../widgets/search_textfield.dart';
import '../../home/models/home_model.dart';
import '../../search/widgets/search_video_widget.dart';
import '../cubit/watch_cubit.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchCubit(),
      child: const WatchPageView(),
    );
  }
}

class WatchPageView extends StatefulWidget {
  const WatchPageView({super.key});

  @override
  State<WatchPageView> createState() => _WatchPageViewState();
}

class _WatchPageViewState extends State<WatchPageView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchCubit, WatchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: SearchTextField(
              hintText: context.localization.tvShowsMoviesAndMore,
              readOnly: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
            ),
          ),
          body: state.status == WatchStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state.status == WatchStatus.error
                  ? Center(
                      child: Text(state.errorMessage),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 4 / 2.6),
                      itemCount: state.videos.length,
                      itemBuilder: (context, index) {
                        DummyVideoModel videoModel = state.videos[index];
                        return WatchVideoWidget(videoModel: videoModel);
                      }),
        );
      },
    );
  }
}
