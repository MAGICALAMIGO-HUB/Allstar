import 'package:alstar/widgit/navigation_draw_widget.dart';
import 'package:flutter/material.dart';

import '../models/terminal_model.dart';

// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
import '../services/report_card.dart';
import '../services/service.dart';
import '../services/student_exam_list.dart';

class Result_page extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

// final box = Hive.box('token');
// final token = box.get('token');
List valuesHere = [];
final tabRows = <TableRow>[];

class _ResultPageState extends State<Result_page> {
  List<TerminalModel> _terminalModel = [];
  List<TerminalModel> _terminalModel1 = [];
  List<TerminalModel> _terminalModel2 = [];
  List<TerminalModel> _terminalModel3 = [];
  Map to_send = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    Service.get_exam_list().then((terminalModel) {
      _terminalModel = terminalModel;
      // _terminalModel1 = _terminalModel;
      _loading = false;
      print('anishanishanishanish');
      print(_terminalModel1.length);
      print(_terminalModel[1].examTitle.toString());
      // for (!to_send.containsKey(_terminalModel[1].examTitle.toString().substring(0, 4));;){
      //
      // }
      terminalModel.forEach((element) {
        print(element.examTitle.toString().substring(0, 4));
        if (!to_send
            .containsKey(element.examTitle.toString().substring(0, 4))) {
          to_send[element.examTitle.toString().substring(0, 4)] = [element];
        } else if (to_send
            .containsKey(element.examTitle.toString().substring(0, 4))) {
          print(element);
          to_send[element.examTitle.toString().substring(0, 4)] =
              to_send[element.examTitle.toString().substring(0, 4)] + [element];
        }
        print(to_send);
        print('>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<');
        // print((to_send['2078'][0] as TerminalModel).examTitle );
      });
      int count = 1;
      // print(to_send.keys);
      for (final e in to_send.keys) {
        // print((to_send[e][0] as TerminalModel).examTitle);

        if (count == 1) {
          _terminalModel1 = to_send[e];
        } else if (count == 2) {
          _terminalModel2 = to_send[e];
        } else if (count == 3) {
          _terminalModel3 = to_send[e];
        }
        // for (final f in _terminalModel1){
        //   print('*******************************');
        //   print((f).examTitle);
        // }
        count++;
      }
      print(_terminalModel1.length);
      print(_terminalModel2.length);
      print(_terminalModel3.length);
      setState(() {
        (_terminalModel1.length);
        (_terminalModel2.length);
        (_terminalModel3.length);
      });

      // print("++++++++++++++++++++++${((to_send['2078']) as TerminalModel).examTitle}");
    });
  }

  // List<TableRow> all = _terminalModel.map<TableRow>((item) {
  //   return getTableRow(item);
  // }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Results'),
        centerTitle: true,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100)),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: SizedBox(),
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
        actions: [Icon(Icons.drag_indicator)],

        // leading: Icon(Icons.density_small_outlined),
      ),
      body: Container(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                valuesHere = await get_exam_list();
                print("Here : ${valuesHere}");
              },
              child: Text('Token'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5), //border corner radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrange.withOpacity(0.5),
                      //color of shadow
                      spreadRadius: 1,
                      //spread radius
                      blurRadius: 1,
                      // blur radius
                      offset: Offset(0, 4), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Center(
                    child: FittedBox(
                      child: Table(
                          defaultColumnWidth: IntrinsicColumnWidth(),
                          // columnWidths: {
                          //   0: FlexColumnWidth(1),
                          //   1: FlexColumnWidth(1),
                          //   2: FlexColumnWidth(4),
                          //
                          // },
                          border: TableBorder.symmetric(
                              // color:  Colors.redAccent,
                              // style: BorderStyle.solid,
                              // width: 2,
                              inside: BorderSide(
                            color: Colors.redAccent,
                            style: BorderStyle.solid,
                            width: 2,
                          )),
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Text('S.N.',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.bold))
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Text('Year',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.bold))
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Text('Terminals',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.bold))
                                ]),
                              ),
                            ]),
                            // for (var terminalModel in _terminalModel2)
                            for (var terminalModel = 1;
                                terminalModel < (_terminalModel1.length + 1);
                                terminalModel++)
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18, right: 20, left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text((terminalModel).toString(),
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.redAccent))
                                          ]),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18, right: 20, left: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                (_terminalModel1[
                                                        terminalModel - 1])
                                                    .examTitle
                                                    .toString()
                                                    .substring(0, 4),
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.redAccent))
                                          ]),
                                    ],
                                  ),
                                ),
                                Column(mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    FittedBox(
                                      alignment: AlignmentDirectional.centerEnd,
                                      fit: BoxFit.fitWidth,
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, right: 20, left: 15),
                                              child: TextButton(onPressed: (){getReportCardHTML(_terminalModel1[terminalModel -1].examTypeClassId, _terminalModel1[terminalModel -1].studentId);},
                                                  child: Text(
                                                      ((_terminalModel1[
                                                                  terminalModel -
                                                                      1])
                                                              .examTitle
                                                              .toString()
                                                              .substring(6))
                                                          .toString()
                                                          .split('-')
                                                          .first,
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          color:
                                                              Colors.redAccent))),

                                            ),
                                            TextButton( onPressed: (){getReportCardHTML(_terminalModel1[terminalModel -1].examTypeClassId, _terminalModel1[terminalModel -1].studentId);},
                                              child: IconButton(
                                                  onPressed: () {getReportCardHTML(_terminalModel1[terminalModel -1].examTypeClassId, _terminalModel1[terminalModel -1].studentId);},
                                                  icon: Icon(
                                                    Icons.remove_red_eye,
                                                    color: Colors.redAccent,
                                                  )),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ])
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5), //border corner radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrange.withOpacity(0.5),
                      //color of shadow
                      spreadRadius: 1,
                      //spread radius
                      blurRadius: 1,
                      // blur radius
                      offset: Offset(0, 4), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Center(
                    child: Table(
                        defaultColumnWidth: IntrinsicColumnWidth(),
                        // columnWidths: {
                        //   0: FlexColumnWidth(1),
                        //   1: FlexColumnWidth(1),
                        //   2: FlexColumnWidth(4),
                        //
                        // },
                        border: TableBorder.symmetric(
                            // color:  Colors.redAccent,
                            // style: BorderStyle.solid,
                            // width: 2,
                            inside: BorderSide(
                          color: Colors.redAccent,
                          style: BorderStyle.solid,
                          width: 2,
                        )),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('S.N.',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('Year',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('Terminals',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                          ]),
                          // for (var terminalModel in _terminalModel2)
                          for (var terminalModel = 1;
                              terminalModel < (_terminalModel2.length + 1);
                              terminalModel++)
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18, right: 20, left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text((terminalModel).toString(),
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.redAccent))
                                        ]),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18, right: 20, left: 15),
                                child: Column(
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              (_terminalModel2[
                                                      terminalModel - 1])
                                                  .examTitle
                                                  .toString()
                                                  .substring(0, 4),
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.redAccent))
                                        ]),
                                  ],
                                ),
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,

                                children: [
                                  FittedBox(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: TextButton(onPressed: (){getReportCardHTML(_terminalModel2[terminalModel -1].examTypeClassId, _terminalModel2[terminalModel -1].studentId);},
                                      child: TextButton(onPressed:(){getReportCardHTML(_terminalModel2[terminalModel -1].examTypeClassId, _terminalModel2[terminalModel -1].studentId);} ,
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, right: 20, left: 15),
                                                child: Text(
                                                    ((_terminalModel2[
                                                                terminalModel - 1])
                                                            .examTitle
                                                            .toString()
                                                            .substring(6))
                                                        .toString()
                                                        .split('-')
                                                        .first,
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Colors.redAccent)),
                                              ),
                                              IconButton(
                                                  onPressed: () {getReportCardHTML(_terminalModel2[terminalModel -1].examTypeClassId, _terminalModel2[terminalModel -1].studentId);},
                                                  icon: Icon(
                                                    Icons.remove_red_eye,
                                                    color: Colors.redAccent,
                                                  ))
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ])
                        ]),
                  ),
                ),
              ),
            ),
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5), //border corner radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrange.withOpacity(0.5),
                      //color of shadow
                      spreadRadius: 1,
                      //spread radius
                      blurRadius: 1,
                      // blur radius
                      offset: Offset(0, 4), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Center(
                    child: Table(
                        defaultColumnWidth: IntrinsicColumnWidth(),
                        // columnWidths: {
                        //   0: FlexColumnWidth(1),
                        //   1: FlexColumnWidth(1),
                        //   2: FlexColumnWidth(4),
                        //
                        // },
                        border: TableBorder.symmetric(
                            // color:  Colors.redAccent,
                            // style: BorderStyle.solid,
                            // width: 2,
                            inside: BorderSide(
                          color: Colors.redAccent,
                          style: BorderStyle.solid,
                          width: 2,
                        )),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('S.N.',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('Year',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('Terminals',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                          ]),
                          // for (var terminalModel in _terminalModel2)
                          for (var terminalModel = 1;
                              terminalModel < (_terminalModel3.length + 1);
                              terminalModel++)
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18, right: 20, left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text((terminalModel).toString(),
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.redAccent))
                                        ]),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18, right: 20, left: 15),
                                child: Column(
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              (_terminalModel3[
                                                      terminalModel - 1])
                                                  .examTitle
                                                  .toString()
                                                  .substring(0, 4),
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.redAccent))
                                        ]),
                                  ],
                                ),
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextButton(onPressed: (){getReportCardHTML(_terminalModel3[terminalModel -1].examTypeClassId, _terminalModel3[terminalModel -1].studentId);},
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, right: 20, left: 15),
                                            child: Text(
                                                ((_terminalModel3[
                                                            terminalModel - 1])
                                                        .examTitle
                                                        .toString()
                                                        .substring(6))
                                                    .toString()
                                                    .split('-')
                                                    .first,
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.redAccent)),
                                          ),
                                          IconButton(
                                              onPressed: () {getReportCardHTML(_terminalModel3[terminalModel -1].examTypeClassId, _terminalModel3[terminalModel -1].studentId);},
                                              icon: Icon(
                                                Icons.remove_red_eye,
                                                color: Colors.redAccent,
                                              ))
                                        ]),
                                  ),
                                ],
                              ),
                            ])
                        ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
