import 'package:ems/app/core/core_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DefaultDrawer extends StatefulWidget {
  @override
  _DefaultDrawerState createState() => _DefaultDrawerState();
}

class _DefaultDrawerState extends State<DefaultDrawer> {
  CoreController _coreController;

  _logoutUser() async {
    await _coreController.logoutCurrentUser();
    Modular.to.pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    _coreController = Modular.get<CoreController>();
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Flutter ems'),
                SizedBox(
                  height: 10.0,
                ),
                _coreController.currentUser.name != null
                    ? Text('Hi, ${_coreController.currentUser.name}')
                    : Container(),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: _logoutUser,
          ),
        ],
      ),
    );
  }
}
