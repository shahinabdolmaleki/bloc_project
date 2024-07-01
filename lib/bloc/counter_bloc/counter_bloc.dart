import 'package:bloc_project/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_project/bloc/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInit(0)) {
    on<DecreamentPressed>((event, emit) {
      emit(UpdatedCounter(--counter));
    });
    on<IncreamentPressed>((event, emit) {
      emit(UpdatedCounter(++counter));
    });
    on<ResetButtonPressed>((event, emit) {
      counter = 0;
      emit(UpdatedCounter(counter));
    });
  }
}
