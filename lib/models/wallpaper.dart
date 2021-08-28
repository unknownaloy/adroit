import 'package:adroit/models/artist_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallpaper.g.dart';

@JsonSerializable(explicitToJson: true)
class Wallpaper {
  @JsonKey(name: "user")
  ArtistDetails artistDetails;

  String id;

  String description;

  int likes;

  int width;

  int height;

  String color;

  @JsonKey(name: "blur_hash")
  String blurHash;

  Wallpaper({
    required this.artistDetails,
    required this.id,
    required this.description,
    required this.likes,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
  });

  factory Wallpaper.fromJson(Map<String, dynamic> json) =>
      _$WallpaperFromJson(json);
  Map<String, dynamic> toJson() => _$WallpaperToJson(this);
}
