library main_view;

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wcx/core/ui/shared/ui_helpers.dart';
import 'package:wcx/core/ui/widgets/busy_button.dart';
import 'package:wcx/core/ui/widgets/input_field.dart';
import 'main_view_model.dart';

part 'main_mobile.dart';
part 'main_tablet.dart';
part 'main_desktop.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => MainViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (BuildContext context, MainViewModel viewModel, Widget child) {
          return ScreenTypeLayout(
            mobile: _MainMobile(viewModel),
            desktop: _MainDesktop(viewModel),
            tablet: _MainTablet(viewModel),
          );
        });
  }
}
