// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$NewsApiService extends NewsApiService {
  _$NewsApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = NewsApiService;

  Future<Response> getNews(
      {String q = "bitcoin",
      String from = "2020-10-27",
      String sort = "publishedAt",
      String apiKey = "b51ea2d0b00346969c1e8e0bf95591d1"}) {
    final $url = '/';
    final Map<String, dynamic> $params = {
      'q': q,
      'from': from,
      'sortBy': sort,
      'apiKey': apiKey
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
