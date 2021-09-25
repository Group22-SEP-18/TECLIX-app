import 'package:dio/dio.dart';
import 'package:teclix/data/models/Leaderboard.dart';
import 'package:teclix/data/url_constants.dart';

class LeaderboardService {
  static Future<dynamic> fetchLeaderboard({token}) async {
    var dio = Dio();
    dio.options.headers['Authorization'] = 'Token ' + token;
    try {
      var response = await dio.get(UrlConstants.allLeaderboardUrl);
      List<Leaderboard> list = [];
      response.data.forEach((element) {
        list.add(Leaderboard.fromJson(element));
      });
      // print(response.data);
      // print(list);
      return list;
    } on DioError catch (e) {
      print(e.response.toString());
      return e.response.toString();
    }
  }
}
