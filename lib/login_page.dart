import 'package:flutter/material.dart';
import 'package:navigation_of_three_pages/home_page.dart';
import 'package:navigation_of_three_pages/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  bool state = false;
  String? name='';

  username() async{
    SharedPreferences sh =await SharedPreferences.getInstance();
    sh.setString('uname', name!);
  }
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  // }
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(appBar: AppBar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: ListView(children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    print('saving');
                    name=value;
                    if (value!.isEmpty) {
                      return 'Name is Required';
                    } else if (value.length < 3) {
                      return 'More than 4 character';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Name', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 60,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your age';
                      } else if ((int.tryParse(value) ?? 101) > 100) {
                        return 'Enter age correctly';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Age', border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.length < 10 || value.length > 10) {
                      return 'Enter 10 digit number';
                    } else if ((int.tryParse(value) ?? 0) < 999999999) {
                      return 'Enter correctly';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Phone', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (!((value!.contains('@')) && (value.contains('.com')))) {
                      return 'Enter valid email';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'minimum 8 character required';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      onPressed: () {
                        username();
                        state = formKey.currentState!.validate();
                        if(state==true){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return HomePage();
                          },));
                          Navigator.pushReplacementNamed(context, MyHomePage.routeName);
                        }
                      },
                      child: Text('Login')),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
