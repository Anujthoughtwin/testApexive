import '../models/timer_model.dart';

abstract class TimerEvent{}

class ProjectEvent extends TimerEvent{
 String? selectedProject;
 ProjectEvent({this.selectedProject});
}

class TaskEvent extends TimerEvent{
 String? selectedTask;
 TaskEvent({this.selectedTask});
}

class CreateTimerEvent extends TimerEvent {
 TimerModel? timerModel;

 CreateTimerEvent({this.timerModel});
}

class GetTimerListEvent extends TimerEvent {

 GetTimerListEvent();
}

class IsCheckedEvent extends TimerEvent{
 bool? isChecked;

 IsCheckedEvent({this.isChecked});
}