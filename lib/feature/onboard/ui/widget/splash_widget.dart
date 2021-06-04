import 'package:flutter/material.dart';
import 'package:boilerplate/common/widget/page_wrapper.dart';

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      body: Container(
        child: Center(
          child: Text("Splash"),
        ),
      ),
    );
  }
}
