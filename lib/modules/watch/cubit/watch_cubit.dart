import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_twenty/modules/home/models/home_model.dart';

part 'watch_state.dart';

class WatchCubit extends Cubit<WatchState> {
  WatchCubit() : super(WatchState.initial());
}
