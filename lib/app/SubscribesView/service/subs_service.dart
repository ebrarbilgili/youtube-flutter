import 'dart:io';

import 'package:dio/dio.dart';

import '../model/subs_model.dart';

class SubsService {
  final Dio service;
  SubsService({required this.service});

  Future<List<SubsModel>> getVideos() async {
    final response = await service.get('/api/videos/');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => SubsModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
