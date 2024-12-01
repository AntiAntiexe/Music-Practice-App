import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:practice_app/pages/profile2.dart';
import 'dart:async';
import 'pages/data.dart';
import 'pages/profile.dart';
import 'other/globals.dart' as globals;

Future<void> main() async {
  runApp(const MyApp());

    final conn = await MySqlConnection.connect(ConnectionSettings(

    host: 'localhost',

    port: 3306,

    user: 'root',

    password: 'Dibat2009',

    db: 'practice_app'));

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavBar Demo',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(53,92,125, 1),
        splashColor: const Color.fromRGBO(114,90,122, 1),
        highlightColor: const Color.fromRGBO(197,108,134, 1),
        hoverColor: const Color.fromRGBO(255,117,130, 1),
        dialogBackgroundColor: const Color.fromRGBO(45, 56, 78, 1)
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //int pageIndex = 0;

  final pages = [
    const main_page(),
    const data(),
    const profile(),
    const profile2(),

  ];

  String checkTitle(){
    if (globals.pageIndex == 1){
      return 'Data';
    }
    else if (globals.pageIndex == 0){
      return 'Timer';
    }
    else {
      return 'My Profile';
    }

  }

  

  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 56, 78, 1),
      appBar: AppBar(
        
        title: Text(
          checkTitle(),
          style: TextStyle(
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(45, 56, 78, 1),
      ),
      body: SafeArea(child: pages[globals.pageIndex],
      ), 
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 80,  // Increased height to fit text
      decoration: BoxDecoration(
        color: const Color.fromRGBO(197,108,134, 1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    globals.pageIndex = 1;
                  });
                  checkTitle();
                },
                icon: globals.pageIndex == 1
                    ? const Icon(
                        Icons.data_array_rounded,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.data_array,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              const Text(
                "Data",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    globals.pageIndex = 0;
                  });
                  checkTitle();
                },
                icon: globals.pageIndex == 0
                    ? const Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              const Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    globals.pageIndex = 3;
                  });
                  checkTitle();
                },
                icon: globals.pageIndex == 3
                    ? const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              const Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  var conn;

  
  



  late Stopwatch stopwatch;
  late Timer t;

  final _stopwatch = Stopwatch();
 
  void handleStartStop() {
    if(stopwatch.isRunning) {
      stopwatch.stop();
    }
    else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;
 
    String milliseconds = (milli % 1000).toString().padLeft(3, "0"); // this one for the miliseconds
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0"); // this is for the second
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0"); // this is for the minute
 
    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
 
    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      if (mounted){
        setState(() {});

      }
    });
  }
 

  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(45, 56, 78, 1),
      child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
                onPressed: () {
                  handleStartStop();
                },
                padding: EdgeInsets.all(0),
                child: Container(
                  height: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,  // this one is use for make the circle on ui.
                    color: Colors.grey.withOpacity(0.1),
                    border: Border.all(
                      color: const Color.fromARGB(255, 38, 47, 66),
                      width: 4,
                    ),
                  ),
                  child: Text(returnFormattedText(), style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),

              SizedBox(height: 15,),
 
              CupertinoButton(     // this the cupertino button and here we perform all the reset button function
                onPressed: () {
                  stopwatch.reset();
                },
                padding: EdgeInsets.all(0),
                child: Text("Reset", style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              
              CupertinoButton(     // this the cupertino button and here we perform all the reset button function
                onPressed: () async {
                  final result = await conn.query("SELECT * FROM practice_app.practice_log");

                for (var row in result) {

                    print('Name: ${row['idpractice_log']}, Email: ${row['time']}, Instrument: ${row['instrument']}, Genre: ${row['genre']}');

                }
                  
                },
                padding: EdgeInsets.all(0),
                child: Text("Connect and add", style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),),
              ),
        ],
      ),
      );
  }
}







class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color.fromARGB(255, 80, 80, 80),
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          print('back');
          Navigator.pop(context);
        }, 
        icon: Icon(Icons.arrow_back,
        color: Theme.of(context).primaryColor,
        )
        ),
        title: Text(
          "IC Robotics Scouting",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
      ), 
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
                      "Starting Position",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 123, 0),
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
        ],
      ),

      );
  }
}