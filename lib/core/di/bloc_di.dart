import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/dashboard/cubit/dashboard_cubit.dart';

class BlocDI extends StatelessWidget {
  const BlocDI({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider<DashboardCubit>(
          create: (context) => DashboardCubit(),
        ),

      ],
      child: child,
    );
  }
}
