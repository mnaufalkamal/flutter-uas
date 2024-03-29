import 'dart:async'; 
import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginpage.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(MyApp()); 
} 

class MyApp extends StatelessWidget { 
@override 
Widget build(BuildContext context) { 
	return MaterialApp( 
	title: 'Splash Screen',
	theme: ThemeData( 
		primarySwatch: Colors.green, 
	), 
	home: MyHomePage(), 
	debugShowCheckedModeBanner: false, 
	); 
} 
} 

class MyHomePage extends StatefulWidget { 
@override 
_MyHomePageState createState() => _MyHomePageState(); 
} 
class _MyHomePageState extends State<MyHomePage> { 
@override 
void initState() { 
	super.initState(); 
	Timer(Duration(seconds: 3), 
		()=>Navigator.pushReplacement(context, 
										MaterialPageRoute(builder: 
														(context) => 
														MyLogin() 
														) 
									) 
		); 
} 
@override 
Widget build(BuildContext context) { 
	return Container( 
	color: Colors.white, 
	child:FlutterLogo(size:MediaQuery.of(context).size.height) 
	); 
} 
} 

