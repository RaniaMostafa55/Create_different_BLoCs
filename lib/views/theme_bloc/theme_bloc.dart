import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  bool darkMode = false;
  ThemeBloc() : super(ThemeInitial()) {
    on<ToggleMode>((event, emit) {
      darkMode = !darkMode;
      if (darkMode == true) {
        emit(DarkModeState());
      } else if (darkMode == false) {
        emit(LightModeState());
      }
    });
  }
}
