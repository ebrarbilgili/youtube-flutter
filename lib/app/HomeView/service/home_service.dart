import 'dart:io';

import 'package:dio/dio.dart';
import 'package:youtube_flutter/app/HomeView/model/home_model.dart';

class HomeService {
  final Dio service;
  HomeService({required this.service});

  Future<List<HomeModel>> getVideos() async {
    final response = await service.get('/api/videos/');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => HomeModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
