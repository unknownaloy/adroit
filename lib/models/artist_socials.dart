import 'package:json_annotation/json_annotation.dart';

part 'artist_socials.g.dart';

@JsonSerializable()
class ArtistSocials {
  @JsonKey(name: "twitter_username")
  String? twitterName;

  @JsonKey(name: "instagram_username")
  String? instagramName;

  @JsonKey(name: "portfolio_url")
  String? portfolioUrl;

  ArtistSocials({
    this.twitterName,
    this.instagramName,
    this.portfolioUrl,
  });

  factory ArtistSocials.fromJson(Map<String, dynamic> json) =>
      _$ArtistSocialsFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistSocialsToJson(this);
}
