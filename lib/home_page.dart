import 'package:flutter/material.dart';
import 'package:navigation_of_three_pages/blue.dart';
import 'package:navigation_of_three_pages/green.dart';
import 'package:navigation_of_three_pages/red.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username='';
  name()async{
    SharedPreferences sh= await SharedPreferences.getInstance();
    setState((){
      username=sh.getString('uname');
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(username!),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Red();
                },));
              },
              child: Text('RED')),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Green();
                },));
              },
              child: Text('GREEN')),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Blue();
                },));
              },
              child: Text('BLUE'))
        ]),
      ),
    );
  }
}
