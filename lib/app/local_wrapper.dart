import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:boilerplate/common/constant/custom_locale.dart';

class LocalWrapper extends StatelessWidget {
  final Widget _child;
  LocalWrapper({required Widget child}) : _child = child;
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: [CustomLocale.english, CustomLocale.nepali],
      path: "assets/translations",
      fallbackLocale: CustomLocale.english,
      child: _child,
    );
  }
}
