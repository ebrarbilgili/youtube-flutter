import 'package:json_annotation/json_annotation.dart';

part 'subs_model.g.dart';

@JsonSerializable()
class SubsModel {
  int? id;
  String? url;
  String? title;
  String? channel;
  String? video_image;
  String? profile_image;

  SubsModel({
    this.id,
    this.url,
    this.title,
    this.channel,
    this.video_image,
    this.profile_image,
  });

  factory SubsModel.fromJson(Map<String, dynamic> json) {
    return _$SubsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubsModelToJson(this);
  }
}
