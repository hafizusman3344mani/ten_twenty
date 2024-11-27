import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:ten_twenty/modules/dashboard/widgets/navbar.dart';
import 'package:ten_twenty/modules/home/pages/home_page.dart';
import 'package:ten_twenty/modules/watch/pages/watch_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    context.read<DashboardCubit>().changeNavSelection(0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          bottomNavigationBar: Navbar(
            tabs: state.tabs,
            onChanged: (index) {
              int selectedIndex = state.tabs.indexOf(state.tabs
                  .firstWhere((element) => element.isSelected == true));

              if (index == selectedIndex + 1 || index == selectedIndex - 1) {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              } else {
                _pageController.jumpToPage(index);
              }
              context.read<DashboardCubit>().changeNavSelection(index);
            },
          ),
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal, // or Axis.vertical
            children: const [
              HomePage(),
              WatchPage(),
              Center(
                child: Text('Media Library'),
              ),
              Center(
                child: Text('More'),
              ),
            ],
          ),
        );
      },
    );
  }
}
