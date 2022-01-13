// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateVM on _CreateVMBase, Store {
  final _$selectedTimeIndexAtom = Atom(name: '_CreateVMBase.selectedTimeIndex');

  @override
  int? get selectedTimeIndex {
    _$selectedTimeIndexAtom.reportRead();
    return super.selectedTimeIndex;
  }

  @override
  set selectedTimeIndex(int? value) {
    _$selectedTimeIndexAtom.reportWrite(value, super.selectedTimeIndex, () {
      super.selectedTimeIndex = value;
    });
  }

  final _$selectedQuestIndexAtom =
      Atom(name: '_CreateVMBase.selectedQuestIndex');

  @override
  int? get selectedQuestIndex {
    _$selectedQuestIndexAtom.reportRead();
    return super.selectedQuestIndex;
  }

  @override
  set selectedQuestIndex(int? value) {
    _$selectedQuestIndexAtom.reportWrite(value, super.selectedQuestIndex, () {
      super.selectedQuestIndex = value;
    });
  }

  final _$createGameAsyncAction = AsyncAction('_CreateVMBase.createGame');

  @override
  Future createGame(dynamic context) {
    return _$createGameAsyncAction.run(() => super.createGame(context));
  }

  @override
  String toString() {
    return '''
selectedTimeIndex: ${selectedTimeIndex},
selectedQuestIndex: ${selectedQuestIndex}
    ''';
  }
}
