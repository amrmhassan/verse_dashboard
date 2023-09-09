import 'package:frontend/package/constants/body_fields.dart';
import 'package:frontend/package/constants/runtime_variables.dart';
import 'package:verse_dashboard/constants/endpoints.dart';
import 'package:verse_dashboard/features/home/data/models/api_key_model.dart';

class ApiKeysDatasource {
  Future<List<ApiKeyModel>> loadApiKeys() async {
    var res = await dio.get(
      EndpointsConstants.listApiKeys,
    );

    var data = res.data['data'] as List;
    var models = data.map((e) => ApiKeyModel.fromJson(e)).toList();
    return models;
  }

  Future<ApiKeyModel> generateApiKey(
    String name, {
    Duration? expireAfter,
  }) async {
    var res = await dio.post(EndpointsConstants.generateApiKey, data: {
      BodyFields.name: name,
      BodyFields.expirySeconds: expireAfter?.inSeconds,
    });
    var apiKeyModel = ApiKeyModel.fromJson(res.data['data']);

    return apiKeyModel;
  }

  Future<ApiKeyModel> toggleApiKeyActiveness(String apiHah) async {
    var res = await dio.post(
      EndpointsConstants.toggleApiKeyActiveness,
      data: {
        BodyFields.apiHash: apiHah,
      },
    );
    var apiKeyModel = ApiKeyModel.fromJson(res.data['data']);
    return apiKeyModel;
  }

  Future<void> deleteApiKey(String apiHash) async {
    await dio.delete(EndpointsConstants.deleteApiKey, data: {
      BodyFields.apiHash: apiHash,
    });
  }
}
