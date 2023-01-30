import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/app/theme.dart';
import 'package:boilerplate/common/constant/env.dart';
import 'package:boilerplate/common/constant/strings.dart';
import 'package:boilerplate/common/navigation/nav.dart';
import 'package:boilerplate/common/route/route_generator.dart';
import 'package:boilerplate/common/route/routes.dart';
import 'package:boilerplate/common/util/multi_repo_povider.dart';
import 'package:boilerplate/common/widget/global_error_widget.dart';

class App extends StatefulWidget {
  final Env env; // EnvValue.development
  App({Key? key, required this.env}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // BlocProvider
    // RepositoryProvider

    return MultiBlocAndRepositoryProvider(
      env: widget.env,
      child: MaterialApp(
        navigatorKey: Nav.navKey,
        builder: (context, Widget? widget) {
          setErrorBuilder(context);
          return widget!;
        },
        debugShowCheckedModeBanner: false,
        darkTheme: CustomTheme.darkTheme,
        theme: CustomTheme.lightTheme,
        title: Strings.APP_TITLE,
        initialRoute: Routes.root,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
