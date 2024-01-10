class TimerModel {
  int? id;
  String? project;
  String? task;
  String? description;
  bool? isFav;

  TimerModel(
      {this.id, this.project, this.task, this.description, this.isFav});

  factory TimerModel.fromJSON(Map<String, dynamic> json) {
    return TimerModel(
      id: json['id'],
      project: json['project'],
      task: json['task'],
      description: json['description'],
      isFav: json['isFav'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'project': project,
      'task': task,
      'description': description,
      'isFav': isFav,
    };
  }
}
