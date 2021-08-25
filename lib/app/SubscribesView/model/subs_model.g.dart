// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubsModel _$SubsModelFromJson(Map<String, dynamic> json) {
  return SubsModel(
    id: json['id'] as int?,
    url: json['url'] as String?,
    title: json['title'] as String?,
    channel: json['channel'] as String?,
    video_image: json['video_image'] as String?,
    profile_image: json['profile_image'] as String?,
  );
}

Map<String, dynamic> _$SubsModelToJson(SubsModel instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'channel': instance.channel,
      'video_image': instance.video_image,
      'profile_image': instance.profile_image,
    };
