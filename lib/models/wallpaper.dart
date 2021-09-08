import 'package:adroit/models/artist_details.dart';
import 'package:adroit/models/image_url.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallpaper.g.dart';

@JsonSerializable(explicitToJson: true)
class Wallpaper extends Equatable {
  @JsonKey(name: "user")
  final ArtistDetails artistDetails;

  @JsonKey(name: "urls")
  final ImageUrl imageUrl;

  final String id;

  final String? description;

  final int likes;

  final int width;

  final int height;

  final String color;

  @JsonKey(name: "blur_hash")
  final String blurHash;

  const Wallpaper({
    required this.artistDetails,
    required this.imageUrl,
    required this.id,
    this.description,
    required this.likes,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
  });

  @override
  List<Object?> get props => [id];

  factory Wallpaper.fromJson(Map<String, dynamic> json) =>
      _$WallpaperFromJson(json);
  Map<String, dynamic> toJson() => _$WallpaperToJson(this);
}
