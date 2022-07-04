import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app/app_dev.dart';
import 'app/local_wrapper.dart';
import 'common/constant/env.dart';
import 'common/util/log.dart';
import 'package:device_preview/device_preview.dart';

/// entrypoint to app in dev mode
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  /// use run zoned to catch all uncaught exceptions
  runZonedGuarded(() {
    runApp(
      DevicePreview(
          builder: (context) =>
              LocalWrapper(child: App(env: EnvValue.development))),
    );
  }, (e, s) {
    Log.e(e);
    Log.d(s);
  });
}
