// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machines_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MachinesViewModel on _MachinesViewModelBase, Store {
  late final _$nameAtom =
      Atom(name: '_MachinesViewModelBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$locationAtom =
      Atom(name: '_MachinesViewModelBase.location', context: context);

  @override
  String? get location {
    _$locationAtom.reportRead();
    return super.location;
  }

  @override
  set location(String? value) {
    _$locationAtom.reportWrite(value, super.location, () {
      super.location = value;
    });
  }

  late final _$dateAtom =
      Atom(name: '_MachinesViewModelBase.date', context: context);

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

  late final _$urlAtom =
      Atom(name: '_MachinesViewModelBase.url', context: context);

  @override
  String? get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String? value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  late final _$uuidAtom =
      Atom(name: '_MachinesViewModelBase.uuid', context: context);

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

  late final _$imageUrlAtom =
      Atom(name: '_MachinesViewModelBase.imageUrl', context: context);

  @override
  String? get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String? value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  late final _$codeAtom =
      Atom(name: '_MachinesViewModelBase.code', context: context);

  @override
  String? get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String? value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$addAsyncAction =
      AsyncAction('_MachinesViewModelBase.add', context: context);

  @override
  Future<int> add(MachinesModel model) {
    return _$addAsyncAction.run(() => super.add(model));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_MachinesViewModelBase.delete', context: context);

  @override
  Future<int> delete(dynamic key) {
    return _$deleteAsyncAction.run(() => super.delete(key));
  }

  late final _$updateAsyncAction =
      AsyncAction('_MachinesViewModelBase.update', context: context);

  @override
  Future<int> update(dynamic key, MachinesModel model) {
    return _$updateAsyncAction.run(() => super.update(key, model));
  }

  late final _$deleteAllAsyncAction =
      AsyncAction('_MachinesViewModelBase.deleteAll', context: context);

  @override
  Future<int> deleteAll(dynamic keys) {
    return _$deleteAllAsyncAction.run(() => super.deleteAll(keys));
  }

  late final _$checkIfExistsAsyncAction =
      AsyncAction('_MachinesViewModelBase.checkIfExists', context: context);

  @override
  Future<bool> checkIfExists(String? code) {
    return _$checkIfExistsAsyncAction.run(() => super.checkIfExists(code));
  }

  @override
  String toString() {
    return '''
name: ${name},
location: ${location},
date: ${date},
url: ${url},
uuid: ${uuid},
imageUrl: ${imageUrl},
code: ${code}
    ''';
  }
}
