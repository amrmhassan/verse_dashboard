// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_key_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiKeyModel _$ApiKeyModelFromJson(Map<String, dynamic> json) => ApiKeyModel(
      name: json['name'] as String,
      apiKey: json['apiKey'] as String,
      createdAt: const DateConverter().fromJson(json['createdAt'] as String),
      expireAfter: json['expireAfter'] == null
          ? null
          : Duration(microseconds: json['expireAfter'] as int),
      hash: json['hash'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$ApiKeyModelToJson(ApiKeyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'apiKey': instance.apiKey,
      'createdAt': const DateConverter().toJson(instance.createdAt),
      'hash': instance.hash,
      'active': instance.active,
      'expireAfter': instance.expireAfter?.inMicroseconds,
    };
