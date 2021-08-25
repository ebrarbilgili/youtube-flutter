import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
import 'package:youtube_flutter/app/CreateView/view/create_view.dart';

import '../../HomeView/view/home_view.dart';
import '../../LibraryView/view/lib_view.dart';
import '../../ShortsView/view/shorts_view.dart';
import '../../SubscribesView/view/subs_view.dart';

part 'base_viewmodel.g.dart';

class BaseViewModel = _BaseViewModelBase with _$BaseViewModel;

abstract class _BaseViewModelBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  void onItemTapped(int index) {
    selectedIndex = index;
  }

  @observable
  var widgetOptions = [
    HomeView(),
    ShortsView(),
    CreateView(),
    SubsView(),
    LibView(),
  ];
}
