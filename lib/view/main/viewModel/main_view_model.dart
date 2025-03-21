import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';

part 'main_view_model.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store, BaseViewModel {

  @override
  void init() {}

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  int currenPageIndex = 0;

  //calendar view
  @observable
  bool showList = false;

  @observable
  bool loading = false;

  @action
  void changeLoading() {

    loading = !loading;
  }

    @action
  void changeShowList() {
    showList = !showList;
  }
  
}
