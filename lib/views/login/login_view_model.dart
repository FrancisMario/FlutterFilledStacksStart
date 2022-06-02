import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:wcx/core/logger.dart';

class LoginViewModel extends ReactiveViewModel {
  Logger log;

  LoginViewModel() {
    log = getLogger(this.runtimeType.toString());
  }

  @override
  // TODO: implement reactiveServices
  List<ReactiveServiceMixin> get reactiveServices => [];
}
