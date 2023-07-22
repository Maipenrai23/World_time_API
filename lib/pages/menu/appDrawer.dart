import 'package:flutter/material.dart';
import 'package:wold_time_app/pages/contact.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Widget _createDrawerItem(
      IconData icon, String text, GestureTapCallback onTap) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              padding: EdgeInsets.all(0.0),
              margin: EdgeInsets.all(0.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: Text('Maiphan BK'),
                      accountEmail: Text('Maiphan@gmail.com'),
                      margin: EdgeInsets.all(0.0),
                      currentAccountPicture: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/user.png"),
                        backgroundColor: Colors.brown,
                      ),
                    ),
                  ],
                ),
              )),
          _createDrawerItem(Icons.contact_phone, 'Contact', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactPage()));
          }),
          _createDrawerItem(Icons.event, 'Events', () {}),
          _createDrawerItem(Icons.note, 'Notes', () {}),
          Divider(),
          _createDrawerItem(Icons.collections_bookmark, 'Steps', () {}),
          _createDrawerItem(Icons.face, 'Authors', () {}),
          _createDrawerItem(Icons.account_box, 'Flutter Documentation', () {}),
          _createDrawerItem(Icons.star, 'Useful Links', () {}),
          Divider(),
          _createDrawerItem(Icons.bug_report, 'Report as issue', () {}),
          ListTile(
            title: Text(
              '0.0.1',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {},
          ),

          // ListTile(
          //   title: const Text('Item 3'),
          //   onTap: () {
          //     // Update the state of the app
          //     // ...
          //     // Then close the drawer
          //     Navigator.pop(context);
          //   },
          // ),

          // create item

          // _createDraweritem(icons.collection_bookmark,
          //     Text: 'Steps', OnTap: () => Navigator.pushNamed(context, '/')),
        ],
      ),
    );
  }
}
