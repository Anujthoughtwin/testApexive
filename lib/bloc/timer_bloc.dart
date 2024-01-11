import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/timer_model.dart';
import '../repository/repository.dart';
import 'timer_event.dart';
import 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent,TimerState>{
  final Repository repository = Repository();

  TimerBloc():super(TimerState()){
    on<ProjectEvent>((event, emit) {
      emit(ProjectState(selectedProject: event.selectedProject));
    });
    on<TaskEvent>((event, emit) {
      emit(TaskState(selectedTask: event.selectedTask));
    });
    on<CreateTimerEvent>((event, emit) {
      repository.insertTodo(event.timerModel);
      emit(CreateTimerState());
    });
    on<GetTimerListEvent>((event, emit) async {
      List<TimerModel> list = await repository.getAllTodos();
      emit(GetTimerListState(timerModel: list));
    });
    on<IsCheckedEvent>((event, emit) {
      emit(IsCheckedState(isChecked: event.isChecked));
    });
  }
}

