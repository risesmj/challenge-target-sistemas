// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextStore on _TextStore, Store {
  late final _$textListAtom =
      Atom(name: '_TextStore.textList', context: context);

  @override
  ObservableList<TextEntity> get textList {
    _$textListAtom.reportRead();
    return super.textList;
  }

  @override
  set textList(ObservableList<TextEntity> value) {
    _$textListAtom.reportWrite(value, super.textList, () {
      super.textList = value;
    });
  }

  late final _$addAsyncAction = AsyncAction('_TextStore.add', context: context);

  @override
  Future<void> add(String text) {
    return _$addAsyncAction.run(() => super.add(text));
  }

  late final _$removeAsyncAction =
      AsyncAction('_TextStore.remove', context: context);

  @override
  Future<void> remove(TextEntity textEntity) {
    return _$removeAsyncAction.run(() => super.remove(textEntity));
  }

  @override
  String toString() {
    return '''
textList: ${textList}
    ''';
  }
}
