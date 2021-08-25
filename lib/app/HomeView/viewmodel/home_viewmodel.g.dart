// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$videoListAtom = Atom(name: '_HomeViewModelBase.videoList');

  @override
  List<HomeModel> get videoList {
    _$videoListAtom.reportRead();
    return super.videoList;
  }

  @override
  set videoList(List<HomeModel> value) {
    _$videoListAtom.reportWrite(value, super.videoList, () {
      super.videoList = value;
    });
  }

  final _$getVideosAsyncAction = AsyncAction('_HomeViewModelBase.getVideos');

  @override
  Future<List<HomeModel>> getVideos() {
    return _$getVideosAsyncAction.run(() => super.getVideos());
  }

  @override
  String toString() {
    return '''
videoList: ${videoList}
    ''';
  }
}
