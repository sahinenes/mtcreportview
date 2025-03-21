import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../product/_variables/database.variables.dart';
import '../model/statistics_model.dart';
part 'statistics_view_model.g.dart';

class StatisticsViewModel = _StatisticsViewModelBase with _$StatisticsViewModel;

abstract class _StatisticsViewModelBase with Store, BaseViewModel {
  @observable
  String? uuid;

  @observable
  int? ok;

  @observable
  int? nok;

  @observable
  int? total;

  @observable
  String? dataName;

  @observable
  String? dataIndex;

  
  @observable
  String? dataType;

  @observable
  String? date;

  @override
  void init() {}

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @action
  Future<int> add(StatisticsModel model) async {
    int state = 1;
    await statisticsBox.add(model).onError((error, stackTrace) => state = 0);
    return state;
  }

  @action
  Future<int> delete(dynamic key) async {
    int state = 1;
    await statisticsBox.delete(key).onError((error, stackTrace) => state = 0);
    return state;
  }

  @action
  Future<int> update(dynamic key, StatisticsModel model) async {
    int state = 1;
    await statisticsBox
        .put(key, model)
        .onError((error, stackTrace) => state = 0);
    return state;
  }

  @action
  Future<int> deleteAll(dynamic keys) async {
    int state = 1;
    await statisticsBox
        .deleteAll(keys)
        .onError((error, stackTrace) => state = 0);
    return state;
  }
}
