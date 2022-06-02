import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:wcx/core/logger.dart';

class MainViewModel extends BaseViewModel {
  Logger log;

  MainViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
