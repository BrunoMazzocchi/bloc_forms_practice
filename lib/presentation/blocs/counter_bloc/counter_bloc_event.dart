part of 'counter_bloc_bloc.dart';

sealed class CounterBlocEvent extends Equatable {
  const CounterBlocEvent();

  @override
  List<Object> get props => [];
}


class Increment extends CounterBlocEvent {}

class Decrement extends CounterBlocEvent {}

class IncrementBy extends CounterBlocEvent {
  final int value;

  const IncrementBy(this.value);

  @override
  List<Object> get props => [value];
}

class CounterReset extends CounterBlocEvent {}