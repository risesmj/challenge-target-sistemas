import 'package:mobx/mobx.dart';

import '../../domain/entities/text_entity.dart';
import '../../domain/repositories/text_repository.dart';

part 'text_store.g.dart';

class TextStore = _TextStore with _$TextStore;

abstract class _TextStore with Store {
  final TextRepository _repository = TextRepository();

  @observable
  ObservableList<TextEntity> textList = ObservableList<TextEntity>();

  _TextStore() {
    _loadData();
  }

  @action
  Future<void> add(String text) async {
    final newText = TextEntity(
      id: DateTime.now().toIso8601String(),
      content: text,
    );

    await _repository.create(text: newText);

    textList.add(newText);
  }

  @action
  Future<void> remove(TextEntity textEntity) async {
    await _repository.delete(id: textEntity.id);
    textList.remove(textEntity);
  }

  @action
  Future<void> update(int index, String newContent) async {
    await _repository.update(id: textList[index].id, newContent: newContent);
    textList[index] = textList[index].copyWith(content: newContent);
  }

  Future<void> _loadData() async {
    final data = await _repository.fetchAll();
    textList.clear();
    textList.addAll(data);
  }
}
