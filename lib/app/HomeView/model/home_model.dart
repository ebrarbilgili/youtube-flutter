import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  int? id;
  String? url;
  String? title;
  String? channel;
  String? video_image;
  String? profile_image;

  HomeModel({
    this.id,
    this.url,
    this.title,
    this.channel,
    this.video_image,
    this.profile_image,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(this);
  }
}
