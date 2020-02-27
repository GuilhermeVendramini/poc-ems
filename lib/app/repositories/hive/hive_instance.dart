import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveInstance {
  HiveInstance._();

  static bool _hiveInitialized = false;

  static initHive() async {
    if (_hiveInitialized == false) {
      _hiveInitialized = true;
      var dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
    }
  }
}
