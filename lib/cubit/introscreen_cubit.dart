import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:convert';
part 'introscreen_state.dart';

class IntroscreenCubit extends Cubit<IntroscreenState> with HydratedMixin {
  IntroscreenCubit() : super(IntroscreenState(introScreenValue: false));

  void introScreenValueDefault() =>
      emit(IntroscreenState(introScreenValue: state.introScreenValue = false));
  void introScreenValueDone() =>
      emit(IntroscreenState(introScreenValue: state.introScreenValue = true));

  @override
  IntroscreenState? fromJson(Map<String, dynamic> json) {
    return IntroscreenState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(IntroscreenState state) {
    return state.toMap();
  }
}
