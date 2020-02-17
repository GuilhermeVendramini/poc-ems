import 'package:ems/app/modules/auth/register/register_controller.dart';
import 'package:ems/app/modules/auth/register/register_module.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initModule(RegisterModule());
  RegisterController register;

  setUp(() {
    register = RegisterModule.to.get<RegisterController>();
  });

  group('[GROUP]: RegisterController', () {
    test("isInstanceOf RegisterController", () {
      expect(register, isInstanceOf<RegisterController>());
    });
  });
}
