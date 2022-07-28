import 'package:flutter/material.dart';
class Profile_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar:AppBar(
      title: Text('Profile'),
      centerTitle: true,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100),bottomRight: Radius.circular(100)),

      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: SizedBox(),
      ),
      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100),bottomRight: Radius.circular(100)),

        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orangeAccent.shade200, Colors.deepOrange.shade800],
              // begin: Alignment.bottomLeft,
              // end: Alignment.topRight,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),),
        ),
      ),
      actions: [Icon(Icons.drag_indicator)],

      // leading: Icon(Icons.density_small_outlined),
    ),
  );
}