import 'package:ems/app/core/core_controller.dart';
import 'package:ems/app/core/core_module.dart';
import 'package:ems/app/shared/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    Modular.init(CoreModule());
  });

  CoreController _coreController;

  setUp(() {
    _coreController = Modular.get<CoreController>();
  });


  group("[GROUP]: Router", () {
    test('[TEST]: Get Router', () {
      expect(Modular.selectRoute("/"), isA<Router>());
      expect(Modular.selectRoute("/home"), null);
      expect(Modular.selectRoute("/login"), isA<Router>());
      expect(Modular.selectRoute("/register"), isA<Router>());
      expect(Modular.selectRoute("/recovery"), isA<Router>());

      _coreController.currentUser = UserModel(
          id: 'id',
          name: 'name',
          email: 'email@test.com'
      );

      expect(Modular.selectRoute("/home"), isA<Router>());
    });
  });
}
