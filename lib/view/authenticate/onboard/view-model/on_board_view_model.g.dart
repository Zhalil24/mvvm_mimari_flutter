// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_board_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnBoardViewMoodel on _OnBoardViewMoodelBase, Store {
  late final _$currentIndexAtom =
      Atom(name: '_OnBoardViewMoodelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_OnBoardViewMoodelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_OnBoardViewMoodelBaseActionController =
      ActionController(name: '_OnBoardViewMoodelBase', context: context);

  @override
  void changeCurrentIndex(int value) {
    final _$actionInfo = _$_OnBoardViewMoodelBaseActionController.startAction(
        name: '_OnBoardViewMoodelBase.changeCurrentIndex');
    try {
      return super.changeCurrentIndex(value);
    } finally {
      _$_OnBoardViewMoodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_OnBoardViewMoodelBaseActionController.startAction(
        name: '_OnBoardViewMoodelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_OnBoardViewMoodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
isLoading: ${isLoading}
    ''';
  }
}
