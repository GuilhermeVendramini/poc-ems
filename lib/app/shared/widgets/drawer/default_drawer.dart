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
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Eventos'),
            onTap: () {
              Modular.to.pushReplacementNamed('/events');
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Trilhas'),
            onTap: () {
              Modular.to.pushReplacementNamed('/trails');
            },
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
