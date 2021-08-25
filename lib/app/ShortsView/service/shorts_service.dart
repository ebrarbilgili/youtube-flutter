import 'dart:io';

import 'package:dio/dio.dart';

import '../model/shorts_model.dart';

class ShortsService {
  final Dio service;
  ShortsService({required this.service});

  Future<List<ShortsModel>> getVideos() async {
    final response = await service.get('/api/videos/');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => ShortsModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
