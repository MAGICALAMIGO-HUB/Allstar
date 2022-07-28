import 'package:alstar/views/result_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../services/exam_service.dart';

class Login_page extends State<MainPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
      // drawer: NavigationDrawerWidget(),

      appBar: AppBar(
        // title: Text('Login'),
        centerTitle: true,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100)),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: Column(
            children: [Image(image:  NetworkImage(
                'https://cebs.edu.np/assets/frontend/images/logo.png'),),
              // CircleAvatar(
              //   radius: 60,
              //   backgroundColor: Colors.transparent,
              //
              //   backgroundImage: NetworkImage(
              //       'https://cebs.edu.np/assets/frontend/images/logo.png'),
              // ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 121,
                child: TextButton(
                  onPressed: () {

                  },
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.login_rounded)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100)),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orangeAccent.shade200,
                  Colors.deepOrange.shade800
                ],
                // begin: Alignment.bottomLeft,
                // end: Alignment.topRight,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        // actions: [Icon(Icons.drag_indicator)],

        // leading: Icon(Icons.density_small_outlined),
      ),
      body: ListView(children: [
        Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid mail id as abc@gmail.com'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your secure password'),
                ),
              ),
              // Divider(
              //   color: Colors.black,
              // ),
              Divider(
                color: Colors.black,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              // Divider(
              //   color: Colors.black,
              // ),
              FlatButton(
                onPressed: (){
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    // Navigator.push(
                        // context, MaterialPageRoute(builder: (_) => Result_page()));
                    // get.to(Result_page()) ;
                    // Get.to(Result_page());
                    print('>>>>>>>>>>>>>${emailController.text}');
                    print('>>>>>>>>>>>>>${passwordController.text}');
                    // getHttp('pabitra@excelpsschool.edu.np','1234');
                    getHttp(emailController.text,passwordController.text);
                    // Get.to(() =>Result_page(), transition: Transition.fadeIn);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],

          ),
        ),
      ]));


}

