import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:galaxy4k/app/theme.dart';
import 'package:galaxy4k/common/constant/env.dart';
import 'package:galaxy4k/common/constant/strings.dart';
import 'package:galaxy4k/common/navigation/nav.dart';
import 'package:galaxy4k/common/route/route_generator.dart';
import 'package:galaxy4k/common/route/routes.dart';
import 'package:galaxy4k/common/util/multi_bloc_listing.dart';
import 'package:galaxy4k/common/widget/global_error_widget.dart';

import 'update_wrapper.dart';

class App extends StatefulWidget {
  final Env env;
  App({Key? key, required this.env}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocAndRepositoryProvider(
      env: widget.env,
      child: UpdateWrapper(
          child: MaterialApp(
        locale: context.locale,
        navigatorKey: Nav.navKey,
        builder: (context, Widget? widget) {
          setErrorBuilder(context);
          return widget!;
        },
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        darkTheme: CustomTheme.darkTheme,
        theme: CustomTheme.lightTheme,
        title: Strings.APP_TITLE,
        initialRoute: Routes.root,
        // wrap the root widget with NotificationWrapper
        onGenerateRoute: RouteGenerator.generateRoute,
      )),
    );
  }
}
