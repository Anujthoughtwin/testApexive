class TimerState {}

class ProjectState extends TimerState {
  String? selectedProject;

  ProjectState({this.selectedProject});
}
class TaskState extends TimerState {
  String? selectedTask;

  TaskState({this.selectedTask});
}
