import 'package:challenge_target_sistemas/app/core/widgets/scaffold_default.dart';
import 'package:challenge_target_sistemas/app/pages/list_text/text_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListTextPage extends StatefulWidget {
  const ListTextPage({super.key});

  @override
  State<ListTextPage> createState() => _ListTextPageState();
}

class _ListTextPageState extends State<ListTextPage> {
  late final TextStore store;
  final _focusField = FocusNode();
  late final TextEditingController _textEditingController;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();

    store = TextStore();
    _textEditingController = TextEditingController();

    _focusField.addListener(() {
      if (!_focusField.hasFocus && !isEditing) {
        _focusField.requestFocus();
      }
    });

    _focusField.requestFocus();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.30,
          child: Card(
            child: Observer(builder: (context) {
              return ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      store.textList[index].content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  titleAlignment: ListTileTitleAlignment.titleHeight,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        iconSize: 35,
                        onPressed: () async {
                          String newContent = '';
                          isEditing = true;
                          await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Editar'),
                              content: TextFormField(
                                autofocus: true,
                                initialValue: store.textList[index].content,
                                onChanged: (s) => newContent = s,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Cancelar',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    store.update(index, newContent);
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Atualizar',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                          isEditing = false;
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        iconSize: 35,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Excluir'),
                              content: const Text('Deseja realmente excluir?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Cancelar',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    store.remove(store.textList[index]);
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Excluir',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: store.textList.length,
              );
            }),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        TextFormField(
          controller: _textEditingController,
          textAlign: TextAlign.center,
          focusNode: _focusField,
          onFieldSubmitted: (value) {
            store.add(value);
            _textEditingController.clear();
          },
          decoration: InputDecoration(
            hintText: 'Digite seu texto',
            counterText: '',
            fillColor: Colors.white,
            filled: true,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
