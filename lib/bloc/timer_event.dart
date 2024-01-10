abstract class TimerEvent{}

class ProjectEvent extends TimerEvent{
 String? selectedProject;
 ProjectEvent({this.selectedProject});
}

class TaskEvent extends TimerEvent{
 String? selectedTask;
 TaskEvent({this.selectedTask});
}