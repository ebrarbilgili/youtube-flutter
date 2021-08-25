import 'package:mobx/mobx.dart';

import '../model/lib_model.dart';
import '../service/lib_service.dart';

part 'lib_viewmodel.g.dart';

class LibViewModel = _LibViewModelBase with _$LibViewModel;

abstract class _LibViewModelBase with Store {
  final LibService libService;

  _LibViewModelBase({required this.libService}) {
    getVideos();
  }

  @observable
  List<LibModel> videoList = [];

  @action
  Future<List<LibModel>> getVideos() async {
    return videoList = await libService.getVideos();
  }
}
