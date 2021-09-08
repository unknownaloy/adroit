import 'package:adroit/models/artist_image.dart';
import 'package:adroit/models/artist_socials.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_url.g.dart';

@JsonSerializable(explicitToJson: true)
class ImageUrl {
  final String regular;

  const ImageUrl({
    required this.regular,
  });

  factory ImageUrl.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlFromJson(json);
  Map<String, dynamic> toJson() => _$ImageUrlToJson(this);
}
