import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ten_twenty/utils/extended_context.dart';

import '../../../constants/app_colors.dart';
import '../models/bottom_navbar_item_model.dart';

class Navbar extends StatelessWidget {
  final List<BottomNavbarItemModel> tabs;
  final Function(int) onChanged;
  const Navbar({super.key, required this.tabs, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Container(
          height: 76,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.dark,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                tabs.length,
                (index) => IconButton(
                    onPressed: () => onChanged(index),
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          tabs[index].icon,
                          colorFilter: ColorFilter.mode(
                              tabs[index].isSelected
                                  ? AppColors.light
                                  : AppColors.grey,
                              BlendMode.srcIn),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            getLocalizedLabel(context,index),
                            style:  TextStyle(
                                fontSize: 10,
                                height: 1.0,
                                color: tabs[index].isSelected
                                    ? AppColors.light
                                    : AppColors.grey,),
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }

  String getLocalizedLabel(BuildContext context, int index) {
    String label = context.localization.dashboard;
    switch (index) {
      case 0:
        label = context.localization.dashboard;
        break;
      case 1:
        label = context.localization.watch;
        break;
      case 2:
        label = context.localization.mediaLibrary;
        break;
      case 3:
        label = context.localization.more;
        break;
    }
    return label;
  }
}
