import 'dart:async';

import 'package:boilerplate/app/app.dart';
import 'package:flutter/material.dart';

import 'common/constant/env.dart';
import 'common/util/log.dart';
import 'package:device_preview/device_preview.dart';

/// entrypoint to app in dev mode
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// use run zoned to catch all uncaught exceptions
  runZonedGuarded(() {
    // runApp(
    //   DevicePreview(
    //     builder: (context) => App(env: EnvValue.development),
    //   ),
    // );

    runApp(
      App(env: EnvValue.development),
    );
  }, (e, s) {
    Log.e(e);
    Log.d(s);
  });
}
