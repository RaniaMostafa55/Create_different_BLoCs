import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrement>((event, emit) {
      counter += 1;
      emit(CounterIncremented());
      if (counter == 10) {
        emit(CounterTen());
      }
    });
    on<CounterDecrement>((event, emit) {
      counter -= 1;
      emit(CounterDecremented());
      if (counter == 10) {
        emit(CounterTen());
      }
    });
  }
}
