part of 'dashboard_cubit.dart';

class DashboardState {
  final List<BottomNavbarItemModel> tabs;

  const DashboardState({required this.tabs});
  factory DashboardState.initial() {
    return DashboardState(tabs: [
      BottomNavbarItemModel(
          label: 'Dashboard', icon: AssetPaths.navFav, isSelected: false),
      BottomNavbarItemModel(
          label: 'Watch', icon: AssetPaths.navSearch, isSelected: false),
      BottomNavbarItemModel(
          label: 'Media Library', icon: AssetPaths.navHome, isSelected: true),
      BottomNavbarItemModel(
          label: 'More', icon: AssetPaths.navCategory, isSelected: false),

    ]);
  }

  DashboardState copyWith({List<BottomNavbarItemModel>? tabs}) {
    return DashboardState(
      tabs: tabs ?? this.tabs,
    );
  }
}
