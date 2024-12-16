
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quizapp_quizzapp/loginscreen.dart';

class Registrationpage extends StatefulWidget {
  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  late Box box;
  TextEditingController nameController = TextEditingController();
  
  TextEditingController passwordController = TextEditingController();
  

  List<Map<String, String>> ListItem = [];
  String _registrationMessage = "";

  @override
  void initState() {
    super.initState();
    box = Hive.box('mybox');
  }

  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(252, 123, 32, 139),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Center(
                //  child: Text(
                //"CREATE NEW ACCOUNT",
                //style: TextStyle(
                  //  fontSize: 25,
                    //fontWeight: FontWeight.bold,
                    //color: Colors.white),
              //)),
              SizedBox(height: 250),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Full Name",style: TextStyle(color: Colors.white),),
                      focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              
              
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Password",style: TextStyle(color: Colors.white),),focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              
              
              SizedBox(height: 60),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 249, 237, 251),
                    shape: RoundedRectangleBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      if (nameController.text.isEmpty ||
                          
                          passwordController.text.isEmpty 
                          ) {
                        _registrationMessage = "All fields are required.";
                        return;
                      }
                      

                      ListItem.add({
                        'name': nameController.text,
                        
                        'password': passwordController.text,
                        
                      });
                      box.put(
                        'ListItem',
                        ListItem.map((e) => Map<String, dynamic>.from(e))
                            .toList(),
                      );

                      nameController.clear();
                      
                      passwordController.clear();
                      
                      _registrationMessage = "Registration Successful";

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Loginpage()));
                    });
                    print("Registered Items:$ListItem");
                  },
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  )),
              SizedBox(height: 40),
              Text("$_registrationMessage"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Already You Have An Account?",style: TextStyle(color: Colors.white),),
                  SizedBox(width: 15),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loginpage()));
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(color: const Color.fromARGB(255, 228, 156, 240)),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}