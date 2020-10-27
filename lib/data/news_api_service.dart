import 'package:chopper/chopper.dart';


part 'news_api_service.chopper.dart';

@ChopperApi(baseUrl: "everything/")
abstract class NewsApiService extends ChopperService{

  @Get()
  Future<Response> getNews({
    @Query("q") String q = "bitcoin",
    @Query("from") String from = "2020-09-17",
    @Query("sortBy") String sort = "publishedAt",
    @Query("apiKey") String apiKey = "b51ea2d0b00346969c1e8e0bf95591d1",
  });

  static NewsApiService create(){

    final client = ChopperClient(baseUrl: "http://newsapi.org/v2/",
      services: [
        _$NewsApiService(),
      ],
      converter: JsonConverter()
    );

    return _$NewsApiService(client);

  }

}

