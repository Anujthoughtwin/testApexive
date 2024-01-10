import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/repository.dart';
import 'timer_event.dart';
import 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent,TimerState>{
  final Repository repository = Repository();

  TimerBloc():super(TimerState()){
    on<SampleEvent>((event, emit) {
      emit(SampleState());
    });
  }
}

