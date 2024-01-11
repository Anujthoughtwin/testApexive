class TimerModel {
  int? id;
  String? project;
  String? task;
  String? description;
  bool? isFav;
  bool? isCompleted;
  DateTime? createdAt;
  DateTime? playAt;
  DateTime? pauseAt;

  TimerModel(
      {this.id,
      this.project,
      this.task,
      this.description,
      this.isFav,
      this.isCompleted,
      this.createdAt,
      this.pauseAt,
      this.playAt});

  factory TimerModel.fromJSON(Map<String, dynamic> json) {
    return TimerModel(
      id: json['id'],
      project: json['project'],
      task: json['task'],
      description: json['description'],
      isFav: json['isFav'],
      isCompleted: json['isCompleted'],
      createdAt: json["createdAt"] == null
          ? null
          : DateTime.parse(json["createdAt"]),
      pauseAt: json["pauseAt"] == null
          ? null
          : DateTime.parse(json["pauseAt"]),
      playAt: json["playAt"] == null
          ? null
          : DateTime.parse(json["playAt"]),
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'project': project,
      'task': task,
      'description': description,
      'isFav': isFav,
      'isCompleted': isCompleted,
      'createdAt': createdAt?.toIso8601String(),
      'pauseAt': pauseAt?.toIso8601String(),
      'playAt': playAt?.toIso8601String(),
    };
  }
}
