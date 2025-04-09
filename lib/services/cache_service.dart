import 'package:get/get.dart';
import 'dart:developer' as dev;

class CacheService {
  static final CacheService _singleton = CacheService._internal();

  CacheService._internal();

  static CacheService get instance => _singleton;

  static final Map<String, dynamic> _cacheResponses = {};

  Future<Response> getResponse({
    required String url,
  }) async {
    Response response = const Response();
    if (_cacheResponses.containsKey(url)) {
      response = await _cacheResponses[url];
    }
    return response;
  }

  Future<bool> contains({
    required String url,
  }) async {
    return _cacheResponses.containsKey(url);
  }

  Future<void> cache({
    required String url,
    required Response response,
  }) async {
    _cacheResponses[url] = response;
  }

  void clear() {
    _cacheResponses.clear();
  }

  Future<void> remove({
    required String url,
  }) async {
    _cacheResponses.remove(url);
  }

  Future<void> print(String massage) async {
    dev.log(massage, name: 'Cache Service');
  }
}
