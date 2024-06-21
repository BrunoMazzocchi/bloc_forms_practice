import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBlocBloc() : super(const CounterBlocState()) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
    on<IncrementBy>(_onIncrementBy);
    on<CounterReset>(_onCounterReset);
  }

  void _onIncrement(Increment event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(
      counter: state.counter + 1,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void _onDecrement(Decrement event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(
      counter: state.counter - 1,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void _onIncrementBy(IncrementBy event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(
      counter: state.counter + event.value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterBlocState> emit) {
    emit(const CounterBlocState());
  }
}