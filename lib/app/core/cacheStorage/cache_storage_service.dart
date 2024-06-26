import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nasa_apod_app/app/features/apod_overview/data/models/response/apod_response_model.dart';

class CacheStorageService {
  final GetStorage _storage;

  CacheStorageService._create(this._storage);

  static Future<CacheStorageService> create() async {
    await GetStorage.init();
    final storage = GetStorage();
    return CacheStorageService._create(storage);
  }

  static const String apodsKey = 'apods';

  ///
  ///This method will cache the first 10 apods which will be loaded when connectivity== offline
  ///
  Future<void> cacheApods(List<Apod> apods) async {
    try {
      await _storage.write(
          apodsKey, apods.take(10).map((e) => e.toJson()).toList());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List<Apod> getCachedApods() {
    try {
      final List<dynamic>? apodsData = _storage.read<List<dynamic>>(apodsKey);
      if (apodsData != null) {
        return apodsData
            .map((apod) => Apod.fromJson(Map<String, dynamic>.from(apod)))
            .toList();
      }
      return [];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<void> clearApodsCache() async {
    try {
      await _storage.remove(apodsKey);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
