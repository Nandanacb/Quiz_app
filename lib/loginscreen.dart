import 'dart:math';


import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quizapp_quizzapp/quizscreen.dart';


class Loginpage extends StatefulWidget {
  const Loginpage({super.key});
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  late Box box;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _loginmessage = "";

  @override
  void initState() {
    super.initState();
    box = Hive.box('mybox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(252, 123, 32, 139),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
            
              
              SizedBox(height: 200),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Username",style: TextStyle(color: Colors.white),
                      ),focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
                  onChanged: (text) {
                    setState(() {
                      _loginmessage = "";
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Password",style: TextStyle(color: Colors.white),),focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
                  onChanged: (text) {
                    setState(() {
                      _loginmessage = "";
                    });
                  },
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      List<dynamic> userListDynamic =
                          box.get('ListItem', defaultValue: []);

                      List<Map<String, String>> userList = userListDynamic
                          .map((e) => Map<String, String>.from(e as Map))
                          .toList();

                      bool userFound = false;
                      bool passwordCorrect = false;

                      for (var user in userList) {
                        if (user['name'] == usernameController.text) {
                          userFound = true;
                          if (user['password'] == passwordController.text) {
                            passwordCorrect = true;
                            break;
                          }
                        }
                      }

                      if (userFound && passwordCorrect) {
                        setState(() {
                          _loginmessage = "Login Scucessful";
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    QuizScreen()));

                        usernameController.clear();
                        passwordController.clear();
                      } else if (userFound) {
                        setState(() {
                          _loginmessage = "Incorrect Password.";
                        });
                      } else {
                        setState(() {
                          _loginmessage = "Username not Found.";
                        });
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.purple),
                    )),
              ),
              SizedBox(height: 35),
              Text("$_loginmessage"),
            ],
          ),
        ),
      ),
    );
  }
}