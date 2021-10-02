import 'package:teclix/data/models/leaderboard_salesperson.dart';

class Leaderboard {
  LeaderboardSalesperson salesperson;
  String pointsToday;
  String pointsCurrentMonth;
  String pointsAllTime;

  Leaderboard(
      {this.salesperson,
      this.pointsToday,
      this.pointsCurrentMonth,
      this.pointsAllTime});

  static Map<String, dynamic> getPointsByCustomerId(
      {List<Leaderboard> list, int id}) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].salesperson.id == id) {
        return {'rank': i + 1, 'details': list[i]};
      }
    }
    return {
      'rank': 0,
      'details': Leaderboard(
          salesperson: null,
          pointsAllTime: '0',
          pointsCurrentMonth: '0',
          pointsToday: '0')
    };
  }

  Leaderboard.fromJson(Map<String, dynamic> json) {
    salesperson = json['salesperson'] != null
        ? new LeaderboardSalesperson.fromJson(json['salesperson'])
        : null;
    pointsToday = json['points_today'];
    pointsCurrentMonth = json['points_current_month'];
    pointsAllTime = json['points_all_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.salesperson != null) {
      data['salesperson'] = this.salesperson.toJson();
    }
    data['points_today'] = this.pointsToday;
    data['points_current_month'] = this.pointsCurrentMonth;
    data['points_all_time'] = this.pointsAllTime;
    return data;
  }
}
