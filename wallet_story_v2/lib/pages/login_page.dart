import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _inputformkey = GlobalKey<FormState>();
  String _inputemail;
  String _inputpass;
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: 'email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      ),
      onSaved: (String value){
        _inputemail = value;
      },
    );
    final passFeild = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: 'password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      ),
      onSaved: (String value){
        _inputpass = value;
      },
    );
    final loginsubmit = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: (){
          _inputformkey.currentState.save();
          print("Email : $_inputemail\nPassword : $_inputpass");
          
          _inputformkey.currentState.reset();
        },
        child: Text('Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
    final backbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
        onPressed: (){
          Navigator.pop(context);
        },
        child: Text('Back',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue[50],
          child: Padding(
            padding: EdgeInsets.all(36),
            child : Form(
              key: _inputformkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 155,
                  // ),
                  // SizedBox(
                  //   height: 45,
                  // ),
                  Text('Wallet story V.2',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  emailField,
                  SizedBox(height: 25),
                  passFeild,
                  SizedBox(height: 25),
                  loginsubmit,
                  SizedBox(height: 15),
                  backbutton,
                ],
              ),
            ),
          ),
        ), 
      ),
    );
  }
}