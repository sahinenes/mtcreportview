import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../product/_variables/database.variables.dart';
import '../model/machines_model.dart';
import '../../../core/base/model/base_view_model.dart';
part 'machines_view_model.g.dart';

class MachinesViewModel = _MachinesViewModelBase with _$MachinesViewModel;

abstract class _MachinesViewModelBase with Store, BaseViewModel {
  @observable
  String? name;

  @observable
  String? location;

  @observable
  String? date;

  @observable
  String? url;

  @observable
  String? uuid;

  @observable
  String? imageUrl;

  @observable
  String? code;

  @override
  void init() {}

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @action
  Future<int> add(MachinesModel model) async {
    int state = 1;
    await machinesBox.add(model).onError((error, stackTrace) => state = 0);
    return state;
  }

  @action
  Future<int> delete(dynamic key) async {
    int state = 1;
    await machinesBox.delete(key).onError((error, stackTrace) => state = 0);
    return state;
  }

  @action
  Future<int> update(dynamic key, MachinesModel model) async {
    int state = 1;
    await machinesBox.put(key, model).onError((error, stackTrace) => state = 0);
    return state;
  }

  @action
  Future<int> deleteAll(dynamic keys) async {
    int state = 1;
    await machinesBox.deleteAll(keys).onError((error, stackTrace) => state = 0);
    return state;
  }

  @action
  Future<bool> checkIfExists(String? code) async {
    final allMachines = machinesBox.values.toList();
    return allMachines.any((element) => element.code == code);
  }
}
