import 'package:flutter/material.dart';
import 'package:flutter_application_1/bmikalkulator.dart';
import 'package:flutter_application_1/crud.dart';
import 'package:flutter_application_1/devprofile.dart';
import 'package:flutter_application_1/exchange_page.dart';
import 'package:flutter_application_1/infogempa.dart';
import 'package:flutter_application_1/kalkulator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>{
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Dashboard"),
      ),
      body: GridView.count (
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder:
                                   (context) => 
                                    CalculatorHome() 
                                ) 
									              );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.calculate, size: 70, color: Colors.blueAccent,),
                    Text("Kalkulator", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context,
                 MaterialPageRoute(builder:
                                 (context) =>
                                 BMICalculator()
                                 )
                );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.calculate_outlined, size: 70, color: Colors.redAccent,),
                    Text("BMI Kalkulator", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context,
                 MaterialPageRoute(builder:
                                 (context) =>
                                 ExchangePage()
                                 )
                );
              },
  
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.monetization_on_rounded, size: 70, color: Colors.greenAccent,),
                    Text("Konversi Mata Uang", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context,
                 MaterialPageRoute(builder:
                                 (context) =>
                                 DeveloperProfilePage()
                                 )
                );
              },
  
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.person, size: 70, color: Color.fromARGB(107, 248, 231, 0),),
                    Text("Developer Profile", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context,
                 MaterialPageRoute(builder:
                                 (context) =>
                                 infogempa()
                                 )
                );
              },
  
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.warning_rounded, size: 70, color: Color.fromARGB(107, 248, 0, 0),),
                    Text("Info Gempa Terkini", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context,
                 MaterialPageRoute(builder:
                                 (context) =>
                                CRUD ()
                                 )
                );
              },
  
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.note_alt_rounded, size: 70, color: Color.fromARGB(107, 0, 248, 170),),
                    Text("CRUD", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate),
          label: 'KalKulator',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate_outlined),
          label: 'BMI',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
        if (index == 0) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else if (index == 1) {
    
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CalculatorHome()));
      } else if (index == 2) {
    
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BMICalculator()));      
      }
      },
    ),
    );
  }
}