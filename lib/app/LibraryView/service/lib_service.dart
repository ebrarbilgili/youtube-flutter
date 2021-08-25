import 'dart:io';

import 'package:dio/dio.dart';

import '../model/lib_model.dart';

class LibService {
  final Dio service;
  LibService({required this.service});

  Future<List<LibModel>> getVideos() async {
    final response = await service.get('/api/videos/');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => LibModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
