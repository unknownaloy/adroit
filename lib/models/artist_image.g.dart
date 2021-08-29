// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistImage _$ArtistImageFromJson(Map<String, dynamic> json) {
  return ArtistImage(
    small: json['small'] as String,
    large: json['large'] as String,
  );
}

Map<String, dynamic> _$ArtistImageToJson(ArtistImage instance) =>
    <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
    };
