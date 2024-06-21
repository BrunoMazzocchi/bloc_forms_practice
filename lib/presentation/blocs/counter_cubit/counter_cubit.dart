import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState());

  void increment() {
    emit(state.copyWith(
      counter: state.counter + 1,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void decrement() {
    emit(state.copyWith(
      counter: state.counter - 1,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void incrementBy(int value) {
    emit(state.copyWith(
      counter: state.counter + value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void reset() {
    emit(const CounterState());
  }
}
