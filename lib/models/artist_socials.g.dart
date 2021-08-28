// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_socials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistSocials _$ArtistSocialsFromJson(Map<String, dynamic> json) {
  return ArtistSocials(
    twitterName: json['twitter_username'] as String?,
    instagramName: json['instagram_username'] as String?,
    portfolioUrl: json['portfolio_url'] as String?,
  );
}

Map<String, dynamic> _$ArtistSocialsToJson(ArtistSocials instance) =>
    <String, dynamic>{
      'twitter_username': instance.twitterName,
      'instagram_username': instance.instagramName,
      'portfolio_url': instance.portfolioUrl,
    };
