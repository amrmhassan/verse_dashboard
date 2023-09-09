import 'package:flutter/material.dart';
import 'package:verse_dashboard/features/home/data/datasources/api_keys_datasource.dart';
import 'package:verse_dashboard/features/home/data/models/api_key_model.dart';

class ConnectedAppsProvider extends ChangeNotifier {
  final ApiKeysDatasource _datasource = ApiKeysDatasource();
  List<ApiKeyModel> _apiKeys = [];
  List<ApiKeyModel> get apiKeys => [..._apiKeys];
  bool loading = false;
  bool creating = false;
  bool toggling = false;

  Future<void> loadApiKeys() async {
    if (_apiKeys.isNotEmpty) return;
    loading = true;
    notifyListeners();
    try {
      _apiKeys = (await _datasource.loadApiKeys()).reversed.toList();
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> generateApiKey(
    String name, {
    Duration? expireAfter,
  }) async {
    creating = true;
    notifyListeners();
    try {
      var model = await _datasource.generateApiKey(
        name,
        expireAfter: expireAfter,
      );
      _apiKeys.insert(0, model);
      creating = false;
      notifyListeners();
    } catch (e) {
      creating = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> toggleApiActiveness(String apiHash) async {
    toggling = true;
    notifyListeners();
    try {
      var model = await _datasource.toggleApiKeyActiveness(apiHash);
      _updateModel(model);
      toggling = false;
      notifyListeners();
    } catch (e) {
      toggling = false;
      notifyListeners();
      rethrow;
    }
  }

  void _updateModel(ApiKeyModel newModel) {
    int index = _apiKeys.indexWhere((element) => element.hash == newModel.hash);
    _apiKeys[index] = newModel;
  }
}
