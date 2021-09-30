import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_bloc.dart';
import 'package:teclix/logic/bloc/root/root_bloc.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_bloc.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/routing/routes.dart';
import 'package:teclix/presentation/screens/start_up.dart';

void main() {
  runApp(TeclixApp());
}

class TeclixApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiBlocProvider(
      providers: [
        BlocProvider<RootBloc>(
          create: (context) => RootBloc(context),
        ),
        BlocProvider<SearchCustomerBloc>(
          create: (context) => SearchCustomerBloc(context),
        ),
        BlocProvider<LeaderboardBloc>(
          create: (context) => LeaderboardBloc(context),
        ),
      ],
      child: MaterialApp(
        // to remove the debugger banner
        debugShowCheckedModeBanner: false,
        builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
            background: Container(color: ColorPrimary)),
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: PrimaryMaterialColor,
        ),
        initialRoute: StartUpPage.id,
        routes: Routes.mapToMainRoutes(context),
      ),
    );
  }
}
