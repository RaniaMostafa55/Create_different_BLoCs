part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterIncremented extends CounterState {}

class CounterDecremented extends CounterState {}

class CounterTen extends CounterState {}
