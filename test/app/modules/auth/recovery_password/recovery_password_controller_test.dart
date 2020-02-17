import 'package:ems/app/modules/auth/recovery_password/recovery_password_controller.dart';
import 'package:ems/app/modules/auth/recovery_password/recovery_password_module.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initModule(RecoveryPasswordModule());
  RecoveryPasswordController recoverypassword;

  setUp(() {
    recoverypassword =
        RecoveryPasswordModule.to.get<RecoveryPasswordController>();
  });

  group('RecoveryPasswordController Test', () {
    test("First Test", () {
      expect(recoverypassword, isInstanceOf<RecoveryPasswordController>());
    });
  });
}
