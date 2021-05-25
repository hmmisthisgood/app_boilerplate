import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'app/app.dart';
import 'app/local_wrapper.dart';
import 'common/constant/env.dart';
import 'common/util/log.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);

  runZonedGuarded(() {
    runApp(
      LocalWrapper(child: App(env: EnvValue.production)),
    );
  }, (e, s) {
    Log.e(e);
    Log.d(s);
  });
}
