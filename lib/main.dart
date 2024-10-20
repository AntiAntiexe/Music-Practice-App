import 'package:flutter/material.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';
import 'pages/page4.dart';
import 'other/globals.dart' as globals;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavBar Demo',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 123, 0),
        splashColor: const Color.fromARGB(255, 255, 123, 0),
        highlightColor: const Color.fromARGB(255, 80, 80, 80),
        hoverColor: const Color.fromARGB(255, 80, 80, 80),
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
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 80, 80, 80),
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Theme.of(context).primaryColor,
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
      body: SafeArea(child: pages[globals.pageIndex],
      ), 
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 80,  // Increased height to fit text
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
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
                    globals.pageIndex = 0;
                  });
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
                    globals.pageIndex = 1;
                  });
                },
                icon: globals.pageIndex == 1
                    ? const Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              const Text(
                "Pit",
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
                    globals.pageIndex = 2;
                  });
                },
                icon: globals.pageIndex == 2
                    ? const Icon(
                        Icons.games_rounded,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.games_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              const Text(
                "Match",
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
                "Scouts/Data",
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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 80, 80, 80),
      child: 
      Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                  "Time To Practice!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 123, 0),
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                Expanded(
                  child: TextField(
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  filled: false,
                  fillColor: Colors.blueAccent,
                  hintText: 'Input Scout Name',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                ),
              ),
              ),
                
                
                SizedBox(width: 20,),
                Expanded(
                  child: TextField(
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  filled: false,
                  fillColor: Colors.blueAccent,
                  hintText: 'Input Team Number',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                ),
              ),
                  ),
                
              
                SizedBox(width: 20,),
            
                Expanded(
                  
                  child: TextField(
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  filled: false,
                  fillColor: Colors.blueAccent,
                  hintText: 'Game Number',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                ),
              ),
                ),
                
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: () {
                  print('Red button pressed');
                }, 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: Text(
                  'Red',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 88, 52, 18),
                  )
                  ),
                ),
                  ),
              ],
            ),
          ),
          
          SizedBox(width: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: () {
                  print('Blue button pressed');
                }, 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: Text(
                  'Blue',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 88, 52, 18),
                  )
                  ),
                ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(height: 20,),
            ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: () { 
                    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NextScreen()),
                    );
                }, 
                
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 123, 0)),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Color.fromARGB(255, 88, 52, 18),
                  )
                  ),
                ),
                ),
              ],
            ),
          )  
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