import 'package:adroit/models/artist_image.dart';
import 'package:adroit/models/artist_socials.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artist_details.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtistDetails {
  @JsonKey(name: "social")
  final ArtistSocials socials;

  @JsonKey(name: "profile_image")
  final ArtistImage artistImage;

  final String id;

  final String name;

  final String? location;

  @JsonKey(name: "total_likes")
  final int totalLikes;

  @JsonKey(name: "total_photos")
  final int totalPhotos;

  const ArtistDetails({
    required this.socials,
    required this.artistImage,
    required this.id,
    required this.name,
    this.location,
    required this.totalLikes,
    required this.totalPhotos,
  });

  factory ArtistDetails.fromJson(Map<String, dynamic> json) =>
      _$ArtistDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistDetailsToJson(this);
}
