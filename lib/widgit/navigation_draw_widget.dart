import 'package:alstar/views/profile_page.dart';
import 'package:flutter/material.dart';

// import 'package:nav';
class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 40);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      

      child: Material(
        child: Container(
          // color: Colors.purple,
        decoration:  BoxDecoration(
        gradient: LinearGradient(
        colors:[Colors.orangeAccent.shade200, Colors.deepOrange.shade800],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,),),

          child: ListView(
            padding: padding,
            children: <Widget>[
              const SizedBox(
                height: 138,
              ),
              BuildMenuItem(
                text: 'Profile',
                icon: Icons.account_circle,
                onClicked:() => selectedItem(context,0),
              ),
              SizedBox(
                height: 16,
              ),
              BuildMenuItem(
                text: 'Result',
                icon: Icons.book,
              ),
              SizedBox(
                height: 16,
              ),
              BuildMenuItem(
                text: 'Persons',
                icon: Icons.people,
              ),
              SizedBox(
                height: 16,
              ),
              BuildMenuItem(
                text: 'College info',
                icon: Icons.account_balance,
              ),
              SizedBox(
                height: 16,
              ),
              BuildMenuItem(
                text: 'Sign out',
                icon: Icons.logout,
              ),
              SizedBox(
                height: 290,
              ),
              Divider(
                color: Colors.white70,
              ),
              const SizedBox(
                height: 16,
              ),
              ListTile(
                  leading: Icon(Icons.copyright),
                  title: Text(
                    'Developed by Anish Kumar Shrestha',
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget BuildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch(index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Profile_page(),));break;
    }
  }
}


