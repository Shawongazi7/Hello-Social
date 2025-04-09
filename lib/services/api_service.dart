import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';
import 'package:meetmax/services/cache_service.dart';
import 'package:meetmax/services/internet_service.dart';

import 'package:meetmax/services/loading_service.dart';

class APIService {
  APIService._();

  static Future<Response> sendGetRequest({
    required String url,
    Function(Response response)? onSuccess,
    Function(Response response)? onFailed,
    bool cached = false,
    bool refresh = false,
    Map<String, String>? headers,
  }) async {
    Response response = const Response();
    final cacheService = CacheService.instance;

    apiServicePrint(
        'Send get request with CACHED ${cached ? 'ON' : 'OFF'} in this url :- $url');

    // Check if cached response is available
    if (!refresh && cached && await cacheService.contains(url: url)) {
      response = await cacheService.getResponse(url: url);
      _cachedResponsePrint(url, response);
      onSuccess?.call(response);
      return response;
    }

    // Check for internet connection
    if (!await InternetService.instance.hasInternet()) {
      onFailed?.call(response);
      return response;
    }

    try {
      // Send GET request with optional headers
      response = await GetConnect().get(url, headers: headers);

      if (response.statusCode == 200) {
        if (refresh) {
          await cacheService.remove(url: url);
        }
        if (cached) {
          await cacheService.cache(url: url, response: response);
        }
        _responsePrint(url, response, cached: cached, refresh: refresh);
        onSuccess?.call(response);
      } else {
        Loading.instanceShowErrorDialog(
          title: 'Error Occurred!',
          message: 'There is some issue. Please try again after a few moments!',
        );
        _statusErrorPrint(url, response.statusCode);
        onFailed?.call(response);
      }
    } catch (error) {
      _errorPrint(url, error);
      onFailed?.call(response);
    }

    return response;
  }

  static Future<Response> sendPatchRequest({
    required String url,
    required Map data,
    Function(Response response)? onSuccess,
    Function(Response response)? onFailed,
    bool cached = false,
    bool refresh = false,
    Map<String, String>? headers,
  }) async {
    Response response = const Response();
    final cacheService = CacheService.instance;

    apiServicePrint(
        'Send patch request with CACHED ${cached ? 'ON' : 'OFF'} in this url :- $url\n➤ Body : ${jsonEncode(data)}');

    if (!refresh) {
      if (cached) {
        if (await cacheService.contains(url: url)) {
          response = await cacheService.getResponse(url: url);
          _cachedResponsePrint(url, response);
          if (onSuccess != null) {
            onSuccess(response);
          }
          return response;
        }
      }
    }

    if (!await InternetService.instance.hasInternet()) {
      if (onFailed != null) {
        onFailed(response);
      }
      return response;
    }

    try {
      // Sending the PATCH request with optional headers
      response = await GetConnect().patch(
        url,
        data,
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (refresh) {
          await cacheService.remove(url: url);
        }
        if (cached) {
          await cacheService.cache(url: url, response: response);
        }

        _responsePrint(url, response, cached: cached, refresh: refresh);
        if (onSuccess != null) {
          onSuccess(response);
        }
      } else {
        Loading.instanceShowErrorDialog(
          title: 'Error Occurred!',
          message: 'There is some issue. Please try again after a few moments!',
        );
        _statusErrorPrint(url, response.statusCode);
        if (onFailed != null) {
          onFailed(response);
        }
      }
    } catch (error) {
      _errorPrint(url, error);
      if (onFailed != null) {
        onFailed(response);
      }
    }
    return response;
  }

  static Future<Response> sendPostRequest({
    required String url,
    required Map data,
    Function(Response response)? onSuccess,
    Function(Response response)? onFailed,
    bool cached = false,
    bool refresh = false,
    Map<String, String>? headers,
  }) async {
    Response response = const Response();
    final cacheService = CacheService.instance;

    apiServicePrint(
        'Send post request with CACHED ${cached ? 'ON' : 'OFF'} in this url :- $url\n➤ Body : ${jsonEncode(data)}');

    if (!refresh) {
      if (cached) {
        if (await cacheService.contains(url: url)) {
          response = await cacheService.getResponse(url: url);
          _cachedResponsePrint(url, response);
          if (onSuccess != null) {
            onSuccess(response);
          }
          return response;
        }
      }
    }

    if (!await InternetService.instance.hasInternet()) {
      if (onFailed != null) {
        onFailed(response);
      }
      return response;
    }

    try {
      // Sending the request with optional headers
      response = await GetConnect().post(
        url,
        data,
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (refresh) {
          await cacheService.remove(url: url);
        }
        if (cached) {
          await cacheService.cache(url: url, response: response);
        }

        _responsePrint(url, response, cached: cached, refresh: refresh);
        if (onSuccess != null) {
          onSuccess(response);
        }
      } else {
        Loading.instanceShowErrorDialog(
          title: 'Error Occurred!',
          message: 'There is some issue. Please try again after a few moments!',
        );
        _statusErrorPrint(url, response.statusCode);
        if (onFailed != null) {
          onFailed(response);
        }
      }
    } catch (error) {
      _errorPrint(url, error);
      if (onFailed != null) {
        onFailed(response);
      }
    }
    return response;
  }

  static Future<Response> sendPostRequestWithFormData({
    required String url,
    required FormData data,
    Function(Response response)? onSuccess,
    Function(Response response)? onFailed,
    Map<String, String>? headers,
  }) async {
    Map<String, dynamic> mapData = {};
    for (var field in data.fields) {
      mapData[field.key] = field.value;
    }

    apiServicePrint(
        'Send post request with "Form Data" on this url :- $url\n➤ Body : ${jsonEncode(mapData)}');

    Response response = const Response();

    if (!await InternetService.instance.hasInternet()) {
      if (onFailed != null) {
        onFailed(response);
      }
      return response;
    }

    try {
      // Add headers to the POST request
      final response = await GetConnect().post(
        url,
        data,
        contentType: "multipart/form-data",
        headers: headers, // Pass headers here
      );

      if (response.statusCode == 200) {
        _responsePrint(url, response);
        if (onSuccess != null) {
          onSuccess(response);
        }
      } else {
        Loading.instanceShowErrorDialog(
          title: 'Error Occurred!',
          message: 'There is some issue. Please try again after a few moments!',
        );
        _statusErrorPrint(url, response.statusCode);
        if (onFailed != null) {
          onFailed(response);
        }
      }
    } catch (error) {
      _errorPrint(url, error);
      if (onFailed != null) {
        onFailed(response);
      }
    }
    return response;
  }

  static Future<Response> sendPutRequest({
    required String url,
    required Map data,
    Function(Response response)? onSuccess,
    Function(Response response)? onFailed,
  }) async {
    apiServicePrint(
        'Send put request on this url :- $url\n➤ Body : ${jsonEncode(data)}');
    Response response = const Response();

    if (!await InternetService.instance.hasInternet()) {
      if (onFailed != null) {
        onFailed(response);
      }
      return response;
    }

    try {
      final response = await GetConnect().put(url, data);
      if (response.statusCode == 200) {
        _responsePrint(url, response);
        if (onSuccess != null) {
          onSuccess(response);
        }
      } else {
        Loading.instanceShowErrorDialog(
          title: 'Error Occurred!',
          message: 'There is some issue. Please try again after a few moments!',
        );
        _statusErrorPrint(url, response.statusCode);
        if (onFailed != null) {
          onFailed(response);
        }
      }
    } catch (error) {
      _errorPrint(url, error);
      if (onFailed != null) {
        onFailed(response);
      }
    }
    return response;
  }

  static Future<Response> sendDeleteRequest({
    required String url,
    Function(Response response)? onSuccess,
    Function(Response response)? onFailed,
  }) async {
    apiServicePrint('Send delete request on this url :- $url');
    Response response = const Response();

    if (!await InternetService.instance.hasInternet()) {
      if (onFailed != null) {
        onFailed(response);
      }
      return response;
    }

    try {
      final response = await GetConnect().delete(url);
      if (response.statusCode == 200) {
        _responsePrint(url, response);
        if (onSuccess != null) {
          onSuccess(response);
        }
      } else {
        Loading.instanceShowErrorDialog(
          title: 'Error Occurred!',
          message: 'There is some issue. Please try again after a few moments!',
        );
        _statusErrorPrint(url, response.statusCode);
        if (onFailed != null) {
          onFailed(response);
        }
      }
    } catch (error) {
      _errorPrint(url, error);
      if (onFailed != null) {
        onFailed(response);
      }
    }
    return response;
  }

  static apiServicePrint(String message) async {
    if (!kReleaseMode) {
      dev.log(message, name: 'API Service');
    }
  }

  static _responsePrint(
    String url,
    Response response, {
    bool cached = false,
    bool refresh = false,
  }) async {
    if (cached) {
      apiServicePrint(
        "Response ↴\n➤ Url : $url\n➤ Code : ${response.status.code}\n➤ Cache : ${refresh ? 'Response Refresh & Cached' : 'Response Cached'}\n➤ Body : ${jsonEncode(response.body)}",
      );
    } else {
      apiServicePrint(
        "Response ↴\n➤ Url : $url\n➤ Code : ${response.status.code}\n➤ Body : ${jsonEncode(response.body)}",
      );
    }
  }

  static _cachedResponsePrint(String url, Response response) async {
    apiServicePrint(
      "Response ↴\n➤ Url : $url\n➤ Code : ${response.status.code}\n➤ Message : This response returns from the cache \n➤ Body : ${jsonEncode(response.body)}",
    );
  }

  static _errorPrint(String url, Object error) async {
    if (!kReleaseMode) {
      dev.log("Request got error ↴\n➤ Url : $url",
          name: 'API Service', error: error);
    }
  }

  static _statusErrorPrint(String url, int? cede) async {
    String message = '';
    if (cede == null) {
      message =
          "An unexpected error occurred while processing your request, and the server did not return a valid status code.";
    } else {
      if (cede == 500) {
        message =
            "An unexpected error occurred on the server. Please check the server logs for more details and investigate the root cause. Ensure that all components are running correctly and that data inputs are handled properly.";
      }
      if (cede == 401) {
        message =
            "Authentication failed. The provided credentials were either missing or incorrect. Verify the authentication process, validate user inputs, and ensure the correct authorization mechanisms are in place.";
      }
      if (cede == 404) {
        message =
            "Resource not found. The requested URL does not correspond to an existing resource. Double-check the URL path, database queries, and routing configurations to ensure the correct mapping and availability of resources.";
      }
    }
    apiServicePrint(
      "Request got error ↴\n➤ Url : $url\n➤ Code : $cede\n➤ Message: $message",
    );
  }
}
