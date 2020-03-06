import 'package:ems/app/core/core_controller.dart';
import 'package:ems/app/core/core_module.dart';
import 'package:ems/app/shared/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /*
  * Path Provider Method Mock
  * */
  dynamic response;
  const MethodChannel path_provider =
      MethodChannel('plugins.flutter.io/path_provider');
  path_provider.setMockMethodCallHandler((MethodCall methodCall) async {
    return response;
  });

  /*
  * Firebase Auth Method Mock
  * */
  const firebase_auth = MethodChannel('plugins.flutter.io/firebase_auth');
  firebase_auth.setMockMethodCallHandler((MethodCall call) async {
    if (call.method == 'signOut') return true;
    throw MissingPluginException();
  });

  CoreController coreController;
  UserModel currentUser;

  setUp(() {
    initModule(CoreModule());
    coreController = CoreModule.to.get<CoreController>();
    //setMockPathProviderPlatform(FakePlatform(operatingSystem: 'android'));
    response = 'test/mock/hive/currentuserbox';
    currentUser = UserModel(name: 'Name', id: 'id', email: 'test@email.com');
  });

  group('[GROUP]: CoreController', () {
    test("isInstanceOf CoreController", () {
      expect(coreController, isInstanceOf<CoreController>());
    });

    test("loadCurrentUser()", () async {
      expect(coreController.currentUser, null);
      expect(coreController.userLoadStatus, UserLoadStatus.IDLE);
      expect(coreController.messageStatus, '');
      expect(await coreController.loadCurrentUser(), equals(isNull));
      expect(coreController.userLoadStatus, UserLoadStatus.DONE);
      coreController.currentUser = currentUser;
      expect(coreController.currentUser, isA<UserModel>());
      expect(coreController.currentUser.name, isA<String>());
      expect(coreController.currentUser.email, isA<String>());
      expect(coreController.currentUser.id, isA<String>());
      expect(coreController.currentUser.email, equals(isNotEmpty));
      expect(await coreController.logoutCurrentUser(), equals(isNull));
      expect(coreController.currentUser, null);
    });
  });
}
