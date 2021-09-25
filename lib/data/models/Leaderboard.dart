import 'package:teclix/data/models/LeaderboardSalesperson.dart';

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
