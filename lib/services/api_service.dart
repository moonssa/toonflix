import "dart:convert";

import "package:http/http.dart" as http;
import "package:toonflix/models/webtoon_episode_model.dart";
import "package:toonflix/models/webtoon_model.dart";
import "package:toonflix/models/wentoon_detail_model.dart";

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      List<WebtoonModel> webtoonInstance = [];

      for (var webtoon in webtoons) {
        webtoonInstance.add(WebtoonModel.fromJson(webtoon));
      }

      return webtoonInstance;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      List<WebtoonEpisodeModel> episodesInstances = [];
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
