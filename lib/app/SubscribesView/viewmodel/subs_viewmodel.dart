import 'package:mobx/mobx.dart';

import '../model/subs_model.dart';
import '../service/subs_service.dart';

part 'subs_viewmodel.g.dart';

class SubsViewModel = _SubsViewModelBase with _$SubsViewModel;

abstract class _SubsViewModelBase with Store {
  final SubsService subsService;

  _SubsViewModelBase({required this.subsService}) {
    getVideos();
  }

  @observable
  List<SubsModel> videoList = [];

  @observable
  List<String> chipList = [
    'All',
    'Today',
    'Keep watching',
    'Unwatched',
    'Live',
    'Streams'
  ];

  @action
  Future<List<SubsModel>> getVideos() async {
    return videoList = await subsService.getVideos();
  }
}
