
import 'database_provider.dart';
import 'models/timer_model.dart';

class DatabaseController{
  final dbClient = DatabaseProvider.dbProvider;

  Future<int> createTODO(TimerModel? todo) async {
    final db = await dbClient.db;
    int result = await db.insert("todoTable", todo!.toJSON());
    return result;
  }

  Future<List<TimerModel>> getAllTODOS({List<String>? columns}) async {
    final db = await dbClient.db;
    var result = await db.query("todoTable",columns: columns);
    List<TimerModel> todos = result.isNotEmpty ? result.map((item) => TimerModel.fromJSON(item)).toList() : [];
    return todos;
  }

  Future<int> updateTODO(TimerModel? todo) async {
    final db = await dbClient.db;
    var result = await db.update("todoTable", todo!.toJSON(),where: "id = ?", whereArgs: [todo.id]);
    return result;
  }

  Future<int> deleteTodo(int id) async {
    final db = await dbClient.db;
    var result = await db.delete("todoTable", where: 'id = ?', whereArgs: [id]);
    return result;
  }
}
