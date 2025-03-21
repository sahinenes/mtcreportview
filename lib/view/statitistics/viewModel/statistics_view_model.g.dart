// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StatisticsViewModel on _StatisticsViewModelBase, Store {
  late final _$uuidAtom =
      Atom(name: '_StatisticsViewModelBase.uuid', context: context);

  @override
  String? get uuid {
    _$uuidAtom.reportRead();
    return super.uuid;
  }

  @override
  set uuid(String? value) {
    _$uuidAtom.reportWrite(value, super.uuid, () {
      super.uuid = value;
    });
  }

  late final _$okAtom =
      Atom(name: '_StatisticsViewModelBase.ok', context: context);

  @override
  int? get ok {
    _$okAtom.reportRead();
    return super.ok;
  }

  @override
  set ok(int? value) {
    _$okAtom.reportWrite(value, super.ok, () {
      super.ok = value;
    });
  }

  late final _$nokAtom =
      Atom(name: '_StatisticsViewModelBase.nok', context: context);

  @override
  int? get nok {
    _$nokAtom.reportRead();
    return super.nok;
  }

  @override
  set nok(int? value) {
    _$nokAtom.reportWrite(value, super.nok, () {
      super.nok = value;
    });
  }

  late final _$totalAtom =
      Atom(name: '_StatisticsViewModelBase.total', context: context);

  @override
  int? get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(int? value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  late final _$dataNameAtom =
      Atom(name: '_StatisticsViewModelBase.dataName', context: context);

  @override
  String? get dataName {
    _$dataNameAtom.reportRead();
    return super.dataName;
  }

  @override
  set dataName(String? value) {
    _$dataNameAtom.reportWrite(value, super.dataName, () {
      super.dataName = value;
    });
  }

  late final _$dataIndexAtom =
      Atom(name: '_StatisticsViewModelBase.dataIndex', context: context);

  @override
  String? get dataIndex {
    _$dataIndexAtom.reportRead();
    return super.dataIndex;
  }

  @override
  set dataIndex(String? value) {
    _$dataIndexAtom.reportWrite(value, super.dataIndex, () {
      super.dataIndex = value;
    });
  }

  late final _$dateAtom =
      Atom(name: '_StatisticsViewModelBase.date', context: context);

  @override
  String? get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String? value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$addAsyncAction =
      AsyncAction('_StatisticsViewModelBase.add', context: context);

  @override
  Future<int> add(StatisticsModel model) {
    return _$addAsyncAction.run(() => super.add(model));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_StatisticsViewModelBase.delete', context: context);

  @override
  Future<int> delete(dynamic key) {
    return _$deleteAsyncAction.run(() => super.delete(key));
  }

  late final _$updateAsyncAction =
      AsyncAction('_StatisticsViewModelBase.update', context: context);

  @override
  Future<int> update(dynamic key, StatisticsModel model) {
    return _$updateAsyncAction.run(() => super.update(key, model));
  }

  late final _$deleteAllAsyncAction =
      AsyncAction('_StatisticsViewModelBase.deleteAll', context: context);

  @override
  Future<int> deleteAll(dynamic keys) {
    return _$deleteAllAsyncAction.run(() => super.deleteAll(keys));
  }

  @override
  String toString() {
    return '''
uuid: ${uuid},
ok: ${ok},
nok: ${nok},
total: ${total},
dataName: ${dataName},
dataIndex: ${dataIndex},
date: ${date}
    ''';
  }
}
