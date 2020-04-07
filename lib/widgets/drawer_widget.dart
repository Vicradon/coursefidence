import 'package:coursefidence/services/auth_service.dart';
import 'package:flutter/Material.dart';

class DrawerWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("User User"),
            accountEmail: Text("user@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("User"),
            ),
          ),
          ListTile(
            title: Text("Overview"),
            leading: Icon(Icons.remove_red_eye),
          ),
          ListTile(
            title: Text("Courses"),
            leading: Icon(Icons.book),
          ),
          ListTile(
            title: Text("About"),
            leading: Icon(Icons.info),
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.exit_to_app),
            onTap: (){
              _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
