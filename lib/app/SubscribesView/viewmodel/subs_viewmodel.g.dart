// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subs_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubsViewModel on _SubsViewModelBase, Store {
  final _$videoListAtom = Atom(name: '_SubsViewModelBase.videoList');

  @override
  List<SubsModel> get videoList {
    _$videoListAtom.reportRead();
    return super.videoList;
  }

  @override
  set videoList(List<SubsModel> value) {
    _$videoListAtom.reportWrite(value, super.videoList, () {
      super.videoList = value;
    });
  }

  final _$chipListAtom = Atom(name: '_SubsViewModelBase.chipList');

  @override
  List<String> get chipList {
    _$chipListAtom.reportRead();
    return super.chipList;
  }

  @override
  set chipList(List<String> value) {
    _$chipListAtom.reportWrite(value, super.chipList, () {
      super.chipList = value;
    });
  }

  final _$getVideosAsyncAction = AsyncAction('_SubsViewModelBase.getVideos');

  @override
  Future<List<SubsModel>> getVideos() {
    return _$getVideosAsyncAction.run(() => super.getVideos());
  }

  @override
  String toString() {
    return '''
videoList: ${videoList},
chipList: ${chipList}
    ''';
  }
}
