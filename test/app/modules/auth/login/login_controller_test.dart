import 'package:ems/app/core/core_module.dart';
import 'package:ems/app/modules/auth/login/login_controller.dart';
import 'package:ems/app/modules/auth/login/login_module.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  initModule(CoreModule());
  initModule(LoginModule());
  LoginController login;

  setUp(() {
    login = LoginModule.to.get<LoginController>();
  });

  group('[GROUP]: LoginController Test', () {
    test("isInstanceOf LoginController", () {
      expect(login, isInstanceOf<LoginController>());
    });

    test("Verify variables", () {
      expect(login.currentUser, equals(isNull));
      expect(login.signInUserStatus, equals(SignInUserStatus.IDLE));
      expect(login.email, equals(isEmpty));
      expect(login.password, equals(isEmpty));
      expect(login.messageStatus, equals(isEmpty));
    });

    test("onChangeEmail", () {
      expect(login.email, equals(isEmpty));
      login.onChangeEmail(' test@email.com ');
      expect(login.email, equals('test@email.com'));
    });

    test("onChangePassword", () {
      expect(login.password, equals(isEmpty));
      login.onChangePassword(' 12345678 ');
      expect(login.password, equals('12345678'));
    });

    test("emailPasswordValidated (email and password)", () {
      login.onChangeEmail(' test@email.com ');
      login.onChangePassword(' 12345678 ');
      expect(login.emailPasswordValidated, equals(isTrue));
    });

    test("emailPasswordValidated (wrong email)", () {
      login.onChangeEmail('testemail.com');
      login.onChangePassword('12345678');
      expect(login.emailPasswordValidated, equals(isFalse));
    });

    test("emailPasswordValidated (wrong password)", () {
      login.onChangeEmail('test@email.com');
      login.onChangePassword('1234567');
      expect(login.emailPasswordValidated, equals(isFalse));
    });
  });
}
