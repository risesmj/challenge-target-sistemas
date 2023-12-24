import 'package:challenge_target_sistemas/app/domain/entities/text_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextRepository {
  Future<List<TextEntity>> fetchAll() async {
    final db = await SharedPreferences.getInstance();

    final list = db
        .getKeys()
        .map<TextEntity>(
          (key) => TextEntity(
            id: key,
            content: db.getString(key) ?? '',
          ),
        )
        .toList();

    list.sort((a, b) => a.id.compareTo(b.id));

    return list;
  }

  Future<bool> create({required TextEntity text}) async {
    final db = await SharedPreferences.getInstance();
    db.setString(text.id, text.content);
    return true;
  }

  Future<bool> delete({required String id}) async {
    final db = await SharedPreferences.getInstance();
    db.remove(id);
    return true;
  }
}
