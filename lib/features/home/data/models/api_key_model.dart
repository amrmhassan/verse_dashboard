import 'package:json_annotation/json_annotation.dart';

part 'api_key_model.g.dart';

@JsonSerializable(explicitToJson: true)
@DateConverter()
class ApiKeyModel {
  final String name;
  final String apiKey;
  final DateTime createdAt;
  final String hash;
  final bool active;

  /// this can be null, to add the option to lifetime api keys
  final Duration? expireAfter;

  const ApiKeyModel({
    required this.name,
    required this.apiKey,
    required this.createdAt,
    required this.expireAfter,
    required this.hash,
    required this.active,
  });

  factory ApiKeyModel.fromJson(Map<String, dynamic> json) =>
      _$ApiKeyModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiKeyModelToJson(this);
}

class DateConverter extends JsonConverter<DateTime, String> {
  const DateConverter();
  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime object) {
    return object.toIso8601String();
  }
}
