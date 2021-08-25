import 'package:mobx/mobx.dart';
import 'package:youtube_flutter/app/HomeView/model/home_model.dart';
import 'package:youtube_flutter/app/HomeView/service/home_service.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final HomeService homeService;

  _HomeViewModelBase({required this.homeService}) {
    getVideos();
  }

  @observable
  List<HomeModel> videoList = [];

  @action
  Future<List<HomeModel>> getVideos() async {
    return videoList = await homeService.getVideos();
  }
}
