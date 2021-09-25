import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/presentation/screens/leaderboard/leaderboard.dart';

import 'leaderboard_bloc.dart';
import 'leaderboard_state.dart';

class LeaderboardProvider extends BlocProvider<LeaderboardBloc> {
  static const String id = '/leaderboard';

  LeaderboardProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => LeaderboardBloc(context),
          child: LeaderboardView(),
        );
}

class LeaderboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LeaderboardBloc, LeaderboardState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
      ],
      child: LeaderboardPage(),
    );
  }
}
