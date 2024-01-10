import '../database_controller.dart';
import '../models/timer_model.dart';

class Repository {
  final DatabaseController dbController = DatabaseController();

  Future<List<TimerModel>> getAllTodos() => dbController.getAllTODOS();

  Future insertTodo(TimerModel? todo) => dbController.createTODO(todo);

  Future updateTodo(TimerModel? todo) => dbController.updateTODO(todo);

  Future deleteTodo(int id) => dbController.deleteTodo(id);
}
