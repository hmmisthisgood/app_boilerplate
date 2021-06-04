import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'app/app_dev.dart';
import 'app/local_wrapper.dart';
import 'common/constant/env.dart';
import 'common/util/log.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);

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
