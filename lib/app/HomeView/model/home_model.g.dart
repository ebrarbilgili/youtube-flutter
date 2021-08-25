// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel(
    id: json['id'] as int?,
    url: json['url'] as String?,
    title: json['title'] as String?,
    channel: json['channel'] as String?,
    video_image: json['video_image'] as String?,
    profile_image: json['profile_image'] as String?,
  );
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'channel': instance.channel,
      'video_image': instance.video_image,
      'profile_image': instance.profile_image,
    };
