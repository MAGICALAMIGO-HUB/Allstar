import 'package:alstar/views/login_page.dart';
import 'package:alstar/widgit/navigation_draw_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //
  await Hive.initFlutter();
  final tokenBox = await Hive.openBox('token');
  runApp( MyApp());

}



class MyApp extends StatelessWidget {
  static String title = 'Results';

   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Results',
      theme: ThemeData.light(),
      home: MainPage(),
      // home: login_page(),
    );
  }

}
class MainPage extends StatefulWidget {
   // MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => Login_page();
  // State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar:AppBar(
      title: Text(MyApp.title),
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
