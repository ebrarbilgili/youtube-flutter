import 'package:json_annotation/json_annotation.dart';

part 'shorts_model.g.dart';

@JsonSerializable()
class ShortsModel {
  int? id;
  String? url;
  String? title;
  String? channel;
  String? video_image;
  String? profile_image;

  ShortsModel({
    this.id,
    this.url,
    this.title,
    this.channel,
    this.video_image,
    this.profile_image,
  });

  factory ShortsModel.fromJson(Map<String, dynamic> json) {
    return _$ShortsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ShortsModelToJson(this);
  }
}
