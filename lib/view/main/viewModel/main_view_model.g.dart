// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainViewModel on _MainViewModelBase, Store {
  late final _$currenPageIndexAtom =
      Atom(name: '_MainViewModelBase.currenPageIndex', context: context);

  @override
  int get currenPageIndex {
    _$currenPageIndexAtom.reportRead();
    return super.currenPageIndex;
  }

  @override
  set currenPageIndex(int value) {
    _$currenPageIndexAtom.reportWrite(value, super.currenPageIndex, () {
      super.currenPageIndex = value;
    });
  }

  late final _$showListAtom =
      Atom(name: '_MainViewModelBase.showList', context: context);

  @override
  bool get showList {
    _$showListAtom.reportRead();
    return super.showList;
  }

  @override
  set showList(bool value) {
    _$showListAtom.reportWrite(value, super.showList, () {
      super.showList = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_MainViewModelBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$_MainViewModelBaseActionController =
      ActionController(name: '_MainViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_MainViewModelBaseActionController.startAction(
        name: '_MainViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_MainViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeShowList() {
    final _$actionInfo = _$_MainViewModelBaseActionController.startAction(
        name: '_MainViewModelBase.changeShowList');
    try {
      return super.changeShowList();
    } finally {
      _$_MainViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currenPageIndex: ${currenPageIndex},
showList: ${showList},
loading: ${loading}
    ''';
  }
}
