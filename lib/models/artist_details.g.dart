// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistDetails _$ArtistDetailsFromJson(Map<String, dynamic> json) {
  return ArtistDetails(
    socials: ArtistSocials.fromJson(json['social'] as Map<String, dynamic>),
    artistImage:
        ArtistImage.fromJson(json['profile_image'] as Map<String, dynamic>),
    id: json['id'] as String,
    name: json['name'] as String,
    location: json['location'] as String,
    totalLikes: json['total_likes'] as int,
    totalPhotos: json['total_photos'] as int,
  );
}

Map<String, dynamic> _$ArtistDetailsToJson(ArtistDetails instance) =>
    <String, dynamic>{
      'social': instance.socials.toJson(),
      'profile_image': instance.artistImage.toJson(),
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'total_likes': instance.totalLikes,
      'total_photos': instance.totalPhotos,
    };
