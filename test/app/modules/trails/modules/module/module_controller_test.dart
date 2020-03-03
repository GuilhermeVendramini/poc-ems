import 'package:ems/app/modules/trails/modules/module/module_controller.dart';
import 'package:ems/app/modules/trails/modules/module/module_module.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initModule(ModuleModule());
  ModuleController module;

  setUp(() {
    module = ModuleModule.to.get<ModuleController>();
  });

  group('ModuleController Test', () {
    test("First Test", () {
      expect(module, isInstanceOf<ModuleController>());
    });
  });
}
