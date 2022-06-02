library login_view;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wcx/core/ui/shared/ui_helpers.dart';
import 'package:wcx/core/ui/widgets/busy_button.dart';
import 'package:wcx/core/ui/widgets/input_field.dart';
import 'login_view_model.dart';
part 'login_mobile.dart';
part 'login_tablet.dart';
part 'login_desktop.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder:
            (BuildContext context, LoginViewModel viewModel, Widget child) {
          return ScreenTypeLayout(
            mobile: _LoginMobile(viewModel),
            desktop: _LoginDesktop(viewModel),
            tablet: _LoginTablet(viewModel),
          );
        });
  }
}
