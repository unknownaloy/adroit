import 'package:json_annotation/json_annotation.dart';

part 'artist_image.g.dart';

@JsonSerializable()
class ArtistImage {
  String small;

  String large;

  ArtistImage({
    required this.small,
    required this.large,
  });

  factory ArtistImage.fromJson(Map<String, dynamic> json) =>
      _$ArtistImageFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistImageToJson(this);
}
