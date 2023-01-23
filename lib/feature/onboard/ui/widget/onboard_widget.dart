import 'package:boilerplate/common/constant/custom_locale.dart';
import 'package:boilerplate/common/constant/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/common/widget/page_wrapper.dart';

class OnboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.welcomeToApp.tr(),
            ),
            MaterialButton(
              onPressed: () {
                context.setLocale(CustomLocale.nepali);
              },
              child: Text("Nepali"),
            ),
            MaterialButton(
              onPressed: () {
                context.setLocale(CustomLocale.english);
              },
              child: Text("English"),
            ),
            MaterialButton(
              onPressed: () {
                context.setLocale(CustomLocale.french);
              },
              child: Text("French"),
            ),
          ],
        ),
      ),
    );
  }
}
