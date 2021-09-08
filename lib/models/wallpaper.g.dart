// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallpaper _$WallpaperFromJson(Map<String, dynamic> json) {
  return Wallpaper(
    artistDetails: ArtistDetails.fromJson(json['user'] as Map<String, dynamic>),
    id: json['id'] as String,
    description: json['description'] as String?,
    likes: json['likes'] as int,
    width: json['width'] as int,
    height: json['height'] as int,
    color: json['color'] as String,
    blurHash: json['blur_hash'] as String,
  );
}

Map<String, dynamic> _$WallpaperToJson(Wallpaper instance) => <String, dynamic>{
      'user': instance.artistDetails.toJson(),
      'id': instance.id,
      'description': instance.description,
      'likes': instance.likes,
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'blur_hash': instance.blurHash,
    };
