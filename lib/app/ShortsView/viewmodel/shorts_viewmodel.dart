import 'package:mobx/mobx.dart';

import '../model/shorts_model.dart';
import '../service/shorts_service.dart';

part 'shorts_viewmodel.g.dart';

class ShortsViewModel = _ShortsViewModelBase with _$ShortsViewModel;

abstract class _ShortsViewModelBase with Store {
  final ShortsService shortsService;

  _ShortsViewModelBase({
    required this.shortsService,
  }) {
    getVideos();
  }

  @observable
  List<ShortsModel> videoList = [];

  @action
  Future<List<ShortsModel>> getVideos() async {
    return videoList = await shortsService.getVideos();
  }
}
