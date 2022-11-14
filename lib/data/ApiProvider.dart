import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:practice/utils/strings.dart';

import 'model/article.dart';
import 'model/login_response.dart';

class ApiProvider {
  final _contextRoot = 'api';

  Future<List<Article>?> fetchArticleData(String? query) async {
    Map<String, Object> params = {
      'filter[content_types][]': 'article',
      'page[size]': '25',
    };

    if (query != null && query.isNotEmpty) {
      params['filter[q]'] = query;
    }

    final results = await response(path: 'contents', parameters: params);
    return results['data'].map<Article>(Article.fromJson).toList(growable: false);
  }

  Future<LoginResponse> userLogin(String? userName, String? pwd) async {
    final body = {
      "phone": userName,
      "password": pwd,
      "deviceID":"123456",
      "deviceToken":"123456"
    };

    final uri = Uri.parse(ConstantString.baseUrl1 + ConstantString.loginParam);
    final headers = _headers;
    final results = await http.post(uri,
        headers: <String, String> {
          HttpHeaders.contentTypeHeader :  "application/json",
        },
        body: jsonEncode(body)
    );
    final jsonObject = json.decode(results.body);
    return LoginResponse.fromJson(jsonObject);
  }

  Future<Article?> getDetailArticleData(String id) async {
    final results = await response(path: 'contents/$id', parameters: {});
    final data = results['data'];
    return Article.fromJson(data);
  }

  Future<Map> response({
    required String path,
    required Map<String, Object> parameters,
  }) async {
    final uri = Uri.https(ConstantString.baseUrl, '$_contextRoot/$path', parameters);
    final headers = _headers;
    final results = await http.get(uri, headers: headers);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  Future<Map> postResponse({
    required String apiParam,
    required postData,
  }) async {
    final uri = Uri.parse(ConstantString.baseUrl1 + apiParam);
    final headers = _headers;
    final body = postData;
    final results = await http.post(uri, headers: headers, body: jsonEncode(body));
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  Map<String, String> get _headers => {
    'content-type': 'application/vnd.api+json; charset=utf-8',
    'Accept': 'application/json',
  };

  Map<String, String> get _postHeaders => {
    'content-type': 'application/vnd.api+json; charset=utf-8',
    'Accept': 'application/json',
  };

  Map<String, String> get _headersWithToken => {
    'Accept': 'application/json',
  };
}