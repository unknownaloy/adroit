import 'package:json_annotation/json_annotation.dart';

part 'image_url.g.dart';

@JsonSerializable(explicitToJson: true)
class ImageUrl {
  final String small;
  final String regular;

  const ImageUrl({
    required this.small,
    required this.regular,
  });

  factory ImageUrl.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlFromJson(json);
  Map<String, dynamic> toJson() => _$ImageUrlToJson(this);
}
