import 'dart:async';

import 'package:boilerplate/app/app.dart';
import 'package:flutter/material.dart';

import 'common/constant/env.dart';
import 'common/util/log.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() {
    runApp(App(env: EnvValue.qa));
  }, (e, s) {
    Log.e(e);
    Log.d(s);
  });
}
