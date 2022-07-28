import 'dart:convert';

import 'package:alstar/widgit/navigation_draw_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../models/terminal_model.dart';

// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
import '../services/service.dart';
import '../services/student_exam_list.dart';

// import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as htmlparser;
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class Report_card_page extends StatefulWidget {
  late final String htmlOutput;
  late final int exam_type_class_id;
  late final int student_id;

  Report_card_page

  (

  this

      .

  htmlOutput,

  this

      .

  exam_type_class_id

  ,

  this

      .

  student_id

  );

  @override
  _Report_card_page_state createState() {
    return _Report_card_page_state(htmlOutput,exam_type_class_id,student_id);
  }
}

// final box = Hive.box('token');
// final token = box.get('token');
List valuesHere = [];
final tabRows = <TableRow>[];

class _Report_card_page_state extends State<Report_card_page> {
  String htmlOutput;
  int student_id;
  int exam_type_class_id ;

  _Report_card_page_state(this.htmlOutput, this.exam_type_class_id, this.student_id);

  String htmlData = """"
<link rel="stylesheet" href="https://ems.allstar.com.np/public/backEnd/css/resultPrintStyle.css" />
<style>
	.gpa,
	.working-days,
	.present-days,
	.absent-days,
	.homework,
	.dance,
	.sports,
	.hygiene,
	.arts,
	.remarks,
	.reg,
	.name,
	.class,
	.father-name,
	.handwriting {
		margin-top: -8px;
	}

	.section,
	.roll,
	.dob {
		margin-top: -5px;
	}

	.term,
	.year {
		margin-top: 4px;
	}
</style>
<section class=" ">



	<div class="marksheet-container mt-20">
		<div class="marksheet-wrapper" id="resizeMarksheet" style="background: url('https://ems.allstar.com.np/public/backEnd/img/result.png'); background-repeat: no-repeat;
    background-size: contain; margin: 0 auto">

			<div class="term">FIRST TERMINAL &nbsp;Examination - &nbsp; 2078 </div>

			<div class="reg">REG No.: 78-479</div>
			<div class="name">THE GRADE (S) SECURED BY: AMRITA SILWAL</div>
			<div class="class">GRADE: 8</div>
			<div class="section">SECTION: ROSE</div>
			<div class="roll">ROLL NO.:1</div>


			<div class="table-wrapper">
				<div class="list">
					<div class="sn">1</div>
					<div class="subject">Nepali</div>
					<div class="credit-hour">4</div>
					<div class="th">A+</div>
					<div class="pr">A+</div>
					<div class="final-grade">A+</div>
					<div class="grade-point">4.0</div>
				</div>
				<div class="list">
					<div class="sn">2</div>
					<div class="subject">English</div>
					<div class="credit-hour">4</div>
					<div class="th">A+</div>
					<div class="pr">A+</div>
					<div class="final-grade">A+</div>
					<div class="grade-point">4.0</div>
				</div>
				<div class="list">
					<div class="sn">3</div>
					<div class="subject">HPE</div>
					<div class="credit-hour">2</div>
					<div class="th">A</div>
					<div class="pr">A+</div>
					<div class="final-grade">A+</div>
					<div class="grade-point">4.0</div>
				</div>
				<div class="list">
					<div class="sn">4</div>
					<div class="subject">OPT Maths</div>
					<div class="credit-hour">4</div>
					<div class="th">A+</div>
					<div class="pr"></div>
					<div class="final-grade">A+</div>
					<div class="grade-point">4.0</div>
				</div>
				<div class="list">
					<div class="sn">5</div>
					<div class="subject">C. Maths</div>
					<div class="credit-hour">4</div>
					<div class="th">A+</div>
					<div class="pr"></div>
					<div class="final-grade">A+</div>
					<div class="grade-point">4.0</div>
				</div>
				<div class="list">
					<div class="sn">6</div>
					<div class="subject">Science</div>
					<div class="credit-hour">4</div>
					<div class="th">A+</div>
					<div class="pr">A+</div>
					<div class="final-grade">A+</div>
					<div class="grade-point">4.0</div>
				</div>
				<div class="list">
					<div class="sn">7</div>
					<div class="subject">Occupation</div>
					<div class="credit-hour">2</div>
					<div class="th">A+</div>
					<div class="pr">A+</div>
					<div class="final-grade">A+</div>
					<div class="grade-point">4.0</div>
				</div>
				<div class="list">
					<div class="sn">8</div>
					<div class="subject">Moral Education</div>
					<div class="credit-hour">2</div>
					<div class="th">A+</div>
					<div class="pr">A</div>
					<div class="final-grade">A+</div>
					<div class="grade-point">4.0</div>
				</div>
				<div class="list">
					<div class="sn">9</div>
					<div class="subject">Social Studies</div>
					<div class="credit-hour">4</div>
					<div class="th">A+</div>
					<div class="pr">A+</div>
					<div class="final-grade">A+</div>
					<div class="grade-point">4.0</div>
				</div>
			</div>
			<div class="gpa"><span>A+</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4.00</div>
			<div class="extra-title">EXTRA ACTIVITIES PROFILE</div>
			<div class="table-wrapper-activities">
				<table border="1" bordercolor="#2c449d">
					<tbody>
						<tr>
							<td width="70%">Home Works</td>
							<td width="30%">A+</td>
						</tr>
						<tr>
							<td width="70%">Handwriting</td>
							<td width="30%">A+</td>
						</tr>
						<tr>
							<td width="70%">Dance</td>
							<td width="30%">A</td>
						</tr>
						<tr>
							<td width="70%">Sports</td>
							<td width="30%">A</td>
						</tr>
						<tr>
							<td width="70%">Hygiene</td>
							<td width="30%">A</td>
						</tr>
						<tr>
							<td width="70%">Arts</td>
							<td width="30%">A</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="attendance-title">
				ATTENDANCE
			</div>
			<div class="attendance-table">
				<div class="item">
					<span class="title">Working Days </span>
					<span class="number">64 </span>
				</div>
				<div class="item">
					<span class="title">Present Days </span>
					<span class="number">53 </span>
				</div>
				<div class="item">
					<span class="title">Absent Days </span>
					<span class="number">11 </span>
				</div>
			</div>

			<div class="remarks">A good result. Keep it up.</div>
			<div class="result-date">
				2078-05-09
			</div>
			<div class="class-teacher">

			</div>
			<div class="school-coordinator">

			</div>
			<div class="principal">
				<img src="https://ems.allstar.com.np/public/uploads/settings/13dd822ac62cff11205d38790ecd1927.png" alt="" />
			</div>
			</div>
		</div>









		<!-- ********** OLD DESIGN MARKSHEET *************** -->

		<!--<div class=" white-box mt-30">-->
		<!--    <div class="row  mt-30">-->
		<!--        <div class="col-md-12 text-center">-->
		<!--            <h2>Allstar It Solution Pvt. ltd</h2>-->
		<!--            <h3>Nagarjun-5, Swayambhu, Kathmandu</h3>-->
		<!--        </div>-->
		<!--        <div class="col-md-12 mt-10 mb-10 text-center" style="background: #cce3ef ;">-->
		<!--            <h3><strong>FIRST TERMINAL Examination, 2078	</strong></h3>-->
		<!--        </div>-->
		<!--        <div class="col-md-6 text-center">-->
		<!--            <div>-->
		<!--                <strong>Name</strong>:&nbsp;&nbsp;<span>AMRITA SILWAL</span>-->
		<!--            </div>-->
		<!--            <div>-->
		<!--                <strong>Grade</strong>:&nbsp;&nbsp;<span>8</span>-->
		<!--            </div>-->
		<!--        </div>-->
		<!--        <div class="col-md-6 text-center">-->
		<!--            <div>-->
		<!--                <strong>Adm No</strong>:&nbsp;&nbsp;<span>479</span>-->
		<!--            </div>-->
		<!--            <div>-->
		<!--                <strong>Roll No</strong>:&nbsp;&nbsp;<span>1</span>-->
		<!--            </div>-->
		<!--        </div>-->
		<!--    </div>-->

		<!--    <div class="container">-->
		<!--        <table class="table table-bordered table1">-->
		<!--            <thead>-->
		<!--                <tr>-->
		<!--                    <th scope="col" class="center" rowspan="2" >SN</th>-->
		<!--                    <th scope="col" class="subject" rowspan="2">Subjects</th>-->
		<!--                    <th scope="col" rowspan="2">Credit <br> Hour</th>-->
		<!--                    <th scope="col" colspan="2" rowspan="1">Obtained <br> Grade</th>-->

		<!--                    <th scope="col" rowspan="2">Final <br> Grade</th>-->
		<!--                    <th scope="col" rowspan="2">Grade <br> Point</th>-->
		<!--                </tr>-->
		<!--                <tr>-->
		<!--                    <th scope="col">TH</th>-->
		<!--                    <th scope="col">PR</th>-->
		<!--                </tr>-->
		<!--            </thead>-->
		<!--            <tbody>-->
		<!--                -->
		<!--                -->
		<!--                    <tr class="no_border">-->
		<!--                        <th scope="row">1</th>-->
		<!--                        <td class="side">&nbsp;&nbsp;Nepali</td>-->
		<!--                        <td>4</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>4.0</td>-->
		<!--                        -->
		<!--                    </tr>-->
		<!--                    -->
		<!--                -->
		<!--                    <tr class="no_border">-->
		<!--                        <th scope="row">2</th>-->
		<!--                        <td class="side">&nbsp;&nbsp;English</td>-->
		<!--                        <td>4</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>4.0</td>-->
		<!--                        -->
		<!--                    </tr>-->
		<!--                    -->
		<!--                -->
		<!--                    <tr class="no_border">-->
		<!--                        <th scope="row">3</th>-->
		<!--                        <td class="side">&nbsp;&nbsp;HPE</td>-->
		<!--                        <td>2</td>-->
		<!--                        <td>A</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>4.0</td>-->
		<!--                        -->
		<!--                    </tr>-->
		<!--                    -->
		<!--                -->
		<!--                    <tr class="no_border">-->
		<!--                        <th scope="row">4</th>-->
		<!--                        <td class="side">&nbsp;&nbsp;OPT Maths</td>-->
		<!--                        <td>4</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td></td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>4.0</td>-->
		<!--                        -->
		<!--                    </tr>-->
		<!--                    -->
		<!--                -->
		<!--                    <tr class="no_border">-->
		<!--                        <th scope="row">5</th>-->
		<!--                        <td class="side">&nbsp;&nbsp;C. Maths</td>-->
		<!--                        <td>4</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td></td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>4.0</td>-->
		<!--                        -->
		<!--                    </tr>-->
		<!--                    -->
		<!--                -->
		<!--                    <tr class="no_border">-->
		<!--                        <th scope="row">6</th>-->
		<!--                        <td class="side">&nbsp;&nbsp;Science</td>-->
		<!--                        <td>4</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>4.0</td>-->
		<!--                        -->
		<!--                    </tr>-->
		<!--                    -->
		<!--                -->
		<!--                    <tr class="no_border">-->
		<!--                        <th scope="row">7</th>-->
		<!--                        <td class="side">&nbsp;&nbsp;Occupation</td>-->
		<!--                        <td>2</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>4.0</td>-->
		<!--                        -->
		<!--                    </tr>-->
		<!--                    -->
		<!--                -->
		<!--                    <tr class="no_border">-->
		<!--                        <th scope="row">8</th>-->
		<!--                        <td class="side">&nbsp;&nbsp;Moral Education</td>-->
		<!--                        <td>2</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>A</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>4.0</td>-->
		<!--                        -->
		<!--                    </tr>-->
		<!--                    -->
		<!--                -->
		<!--                    <tr class="no_border">-->
		<!--                        <th scope="row">9</th>-->
		<!--                        <td class="side">&nbsp;&nbsp;Social Studies</td>-->
		<!--                        <td>4</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>A+</td>-->
		<!--                        <td>4.0</td>-->
		<!--                        -->
		<!--                    </tr>-->
		<!--                    -->
		<!--                -->


		<!--                <tr>-->
		<!--                    <td scope="row" colspan="8" class="border right">GRADE POINT AVERAGE(GPA): 4.00 A+</td>-->
		<!--                </tr>-->

		<!--            </tbody>-->
		<!--        </table>-->



		<!--        <div class="row">-->
		<!--            <div class="col-lg-6 mt-30">-->
		<!--                <table class="table table-bordered table2">-->
		<!--                    <thead>-->
		<!--                        <tr>-->
		<!--                            <th scope="row" colspan="2"> ATTENDANCE</td>-->
		<!--                        </tr>-->
		<!--                    </thead>-->
		<!--                    <tbody>-->
		<!--                        <tr>-->
		<!--                            <th scope="row">School Days</th>-->
		<!--                            <th scope="row">64</th>-->
		<!--                        </tr>-->
		<!--                        <tr>-->
		<!--                            <th scope="row">Present Days</th>-->
		<!--                            <th scope="row">53</th>-->
		<!--                        </tr>-->
		<!--                        <tr>   -->
		<!--                            <th scope="row">Absent Days</th>-->
		<!--                            <th scope="row">11</th>-->
		<!--                        </tr>-->
		<!--                    </tbody>-->
		<!--                </table>-->
		<!--                <table class="table table-bordered table2 mt-30">-->
		<!--                    <thead>-->
		<!--                        <tr>-->
		<!--                            <th scope="row" colspan="2"> Extra Activities</td>-->
		<!--                        </tr>-->
		<!--                    </thead>-->
		<!--                    <tbody>-->
		<!--                        -->
		<!--                            <tr>-->
		<!--                                <th scope="row">Home Works</th>-->
		<!--                                <th scope="row">A+</th>    -->
		<!--                            </tr>-->
		<!--                        -->
		<!--                            <tr>-->
		<!--                                <th scope="row">Handwriting</th>-->
		<!--                                <th scope="row">A+</th>    -->
		<!--                            </tr>-->
		<!--                        -->
		<!--                            <tr>-->
		<!--                                <th scope="row">Dance</th>-->
		<!--                                <th scope="row">A</th>    -->
		<!--                            </tr>-->
		<!--                        -->
		<!--                            <tr>-->
		<!--                                <th scope="row">Sports</th>-->
		<!--                                <th scope="row">A</th>    -->
		<!--                            </tr>-->
		<!--                        -->
		<!--                            <tr>-->
		<!--                                <th scope="row">Hygiene</th>-->
		<!--                                <th scope="row">A</th>    -->
		<!--                            </tr>-->
		<!--                        -->
		<!--                            <tr>-->
		<!--                                <th scope="row">Arts</th>-->
		<!--                                <th scope="row">A</th>    -->
		<!--                            </tr>-->
		<!--                        -->
		<!--                    </tbody>-->
		<!--                </table>-->
		<!--            </div>-->
		<!--            <div class="col-lg-6 mt-30">-->
		<!--                <table class="table table-bordered table2">-->
		<!--                    <thead>-->
		<!--                        <tr>-->
		<!--                            <th scope="row" colspan="5" > DETAILS OF GRADE SHEET</th>-->
		<!--                        </tr>-->
		<!--                    </thead>-->
		<!--                    <tbody>-->
		<!--                        <tr>-->
		<!--                            <th scope="row">Marks Range</th>-->
		<!--                            <th scope="row">Grade</th>-->
		<!--                            <th scope="row">Description</th>-->
		<!--                            <th scope="row">Grade</th>-->
		<!--                        </tr>-->
		<!--                        <tr>-->
		<!--                            <th scope="row">90 - 100</th>-->
		<!--                            <th scope="row">A+</th>-->
		<!--                            <th scope="row">Outstanding</th>-->
		<!--                            <th scope="row">4.0</th>-->
		<!--                        </tr>-->
		<!--                        <tr>-->
		<!--                            <th scope="row">80 - 90</th>-->
		<!--                            <th scope="row">A</th>-->
		<!--                            <th scope="row">Excellent</th>-->
		<!--                            <th scope="row">3.6</th>-->
		<!--                        </tr>-->
		<!--                        <tr>-->
		<!--                            <th scope="row">70 - 80</th>-->
		<!--                            <th scope="row">B+</th>-->
		<!--                            <th scope="row">Very Good</th>-->
		<!--                            <th scope="row">3.2</th>-->
		<!--                        </tr>-->
		<!--                        <tr>-->
		<!--                            <th scope="row">60 - 70</th>-->
		<!--                            <th scope="row">B</th>-->
		<!--                            <th scope="row">Good</th>-->
		<!--                            <th scope="row">2.8</th>-->
		<!--                        </tr>-->
		<!--                        <tr>-->
		<!--                            <th scope="row">50 - 60</th>-->
		<!--                            <th scope="row">C+</th>-->
		<!--                            <th scope="row">Satisfactory</th>-->
		<!--                            <th scope="row">2.4</th>-->
		<!--                        </tr>-->
		<!--                        <tr>-->
		<!--                            <th scope="row">40 - 50</th>-->
		<!--                            <th scope="row">C</th>-->
		<!--                            <th scope="row">Acceptable</th>-->
		<!--                            <th scope="row">2.0</th>-->
		<!--                        </tr>-->
		<!--                        <tr>-->
		<!--                            <th scope="row">30 - 40</th>-->
		<!--                            <th scope="row">D+</th>-->
		<!--                            <th scope="row">Partially Acceptable</th>-->
		<!--                            <th scope="row">1.6</th>-->
		<!--                        </tr>-->
		<!--                        <tr>-->
		<!--                            <th scope="row">20 - 30</th>-->
		<!--                            <th scope="row">D</th>-->
		<!--                            <th scope="row">Insufficient</th>-->
		<!--                            <th scope="row">1.2</th>-->
		<!--                        </tr>-->
		<!--                        <tr>-->
		<!--                            <th scope="row">Below 20%</th>-->
		<!--                            <th scope="row">E</th>-->
		<!--                            <th scope="row">Very Insufficient</th>-->
		<!--                            <th scope="row">0.8</th>-->
		<!--                        </tr>-->
		<!--                    </tbody>-->
		<!--                </table>-->
		<!--            </div>-->
		<!--            <div class="col-lg-8">-->
		<!--                <strong>Remarks:</strong>&nbsp;&nbsp;&nbsp; -->
		<!--                <span>-->
		<!--                    A good result. Keep it up.-->
		<!--                </span>-->
		<!--            </div>  -->
		<!--            <div class="col-lg-4 text-right">-->
		<!--                <strong>Date:</strong>&nbsp;&nbsp;&nbsp; -->
		<!--                <span>-->
		<!--                    2078-05-09-->
		<!--                </span>-->
		<!--            </div>  -->
		<!--        </div>-->
		<!--    </div>-->
		<!--</div>-->


		<!-- ********** OLD DESIGN MARKSHEET END *************** -->

</section>

<script>
	let Marksheet = document.getElementById('resizeMarksheet');
           Marksheet.style.transformOrigin = "top left";
           console.log(Marksheet)
           \$(window).resize(function() { 
                
        let winWidth = window.innerWidth;
        if(winWidth < 768){
            let scaleVal = winWidth / 780;
            console.log(scaleVal);
             Marksheet.style.transform = "scale(" + scaleVal + ")";
        }
        console.log(winWidth);
 });
           
          
           
</script>
  """"";

  // set controller(WebViewPlusController controller) {}
  late WebViewController controller;



  // List<TableRow> all = _terminalModel.map<TableRow>((item) {
  //   return getTableRow(item);
  // }).toList();

  // dom.Document document = htmlparser.parse(htmlData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Report Card'),
        centerTitle: true,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100)),
        ),
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(200),
        //   child: SizedBox(),
        // ),
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
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
      body:

      // child: SingleChildScrollView(
      // color: Colors.deepOrange,
      // padding: EdgeInsets.all(16),
      // width: double.infinity,
      // height: double.infinity,
      // child: Html(
      //   // data: '----------${htmlData}',
      //   data: document ,
      //
      // ),

      Container(
        alignment: AlignmentDirectional.topStart,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
          child: WebView(
            // initialUrl: 'https://ems.allstar.com.np/show/result?student_id=$student_id&exam_type_id=$exam_type_class_id',
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (int progress){
              print('WebView is loading (progress : $progress%)');
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },



            onWebViewCreated: (controller){
              this.controller = controller as WebViewController;

              loadLoaclHtml();
            },


          ),
        ),
      ),
      // ),
    );
  }

  Future<void> loadLoaclHtml() async {
    final html = await rootBundle.loadString('assets/index3.html');
    // final html =  await rootBundle.loadString('assets/index2.html');
    final url = Uri.dataFromString(
      // htmlOutput.toString(),
      html,
      //   htmlData,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),

    ).toString();
    controller.loadUrl(url);
  }
}

