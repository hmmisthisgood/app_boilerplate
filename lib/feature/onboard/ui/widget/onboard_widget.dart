import 'package:flutter/material.dart';
import 'package:boilerplate/common/widget/page_wrapper.dart';

class OnboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      body: Center(
        child: Text("Onboarding page"),
      ),
    );
  }
}
