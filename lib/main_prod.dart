import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app/app_prod.dart';
import 'app/local_wrapper.dart';
import 'common/constant/env.dart';
import 'common/util/log.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runZonedGuarded(() {
    runApp(
      LocalWrapper(child: App(env: EnvValue.production)),
    );
  }, (e, s) {
    Log.e(e);
    Log.d(s);
  });
}
