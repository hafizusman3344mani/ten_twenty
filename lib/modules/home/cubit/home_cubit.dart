import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty/modules/home/models/home_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
}
