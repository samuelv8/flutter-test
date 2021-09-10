import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/dashboard.dart';
import 'package:flutter_application_1/pages/forms.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/settings.dart';
import 'package:flutter_application_1/pages/spreadsheet.dart';
import 'package:flutter_application_1/utils/constants.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Omni Manager"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
          )
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  label: Text("Home"),
                  selectedIcon: Icon(Icons.home)),
              NavigationRailDestination(
                  icon: Icon(Icons.list_outlined),
                  label: Text("List"),
                  selectedIcon: Icon(Icons.list)),
              NavigationRailDestination(
                  icon: Icon(Icons.forum_outlined),
                  label: Text("Forms"),
                  selectedIcon: Icon(Icons.forum)),
              NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined),
                  label: Text("Settings"),
                  selectedIcon: Icon(Icons.settings)),
            ],
          ),
          const VerticalDivider(
            width: 1,
          ),
          _pageAtIndex(_selectedIndex)
        ],
      ),
    );
  }
}

Widget _pageAtIndex(int index) {
  switch (index) {
    case 0:
      return DashboardPage();
    case 1:
      return SpreadsheetPage();
    case 2:
      return FormsPage();
    case 3:
      return SettingsPage();
  }

  return const Center(
    child: Text('Oops'),
  );
}
