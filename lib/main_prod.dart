import 'dart:async';

import 'package:flutter/material.dart';

import 'app/app.dart';
import 'common/constant/env.dart';
import 'common/util/log.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() {
    runApp(
      App(env: EnvValue.production),
    );
  }, (e, s) {
    Log.e(e);
    Log.d(s);
  });
}
