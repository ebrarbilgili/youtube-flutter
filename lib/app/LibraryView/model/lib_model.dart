import 'package:json_annotation/json_annotation.dart';

part 'lib_model.g.dart';

@JsonSerializable()
class LibModel {
  int? id;
  String? url;
  String? title;
  String? channel;
  String? video_image;
  String? profile_image;

  LibModel({
    this.id,
    this.url,
    this.title,
    this.channel,
    this.video_image,
    this.profile_image,
  });

  factory LibModel.fromJson(Map<String, dynamic> json) {
    return _$LibModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LibModelToJson(this);
  }
}
