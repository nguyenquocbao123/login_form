import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailForm{
  String email='nothing';
  String pass='nothing';
  EmailForm({this.email,this.pass});
  bool Condtion(){
    if(this.email==this.pass){
      return true;
    }
    return false;
  }
  bool setEmail(String email){
    if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
     this.email=email;
      return true;
    }
    this.email='Invalid Email';
    return false;
  }
  bool setPass(String pass){
    if(pass==this.email){
      this.pass=pass;
      return true;
    }
    this.pass='Invalid pass';
    return false;
  }
}
class LoginPage extends StatefulWidget
{

  LoginPageState createState()=> LoginPageState();

}

class LoginPageState extends State<LoginPage> {
  bool _showPass=false;
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  EmailForm form= EmailForm();
  final _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:Form(
          key: _formKey,
          child:Container(
              padding: EdgeInsets.fromLTRB(30,70, 30, 30),
              constraints: BoxConstraints.expand(),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.all(15),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffd8d8d8)
                      ),
                      child: FlutterLogo()),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Hello \nwelcome back', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 30
                        ),),
                      ],
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 20),
                    controller: _userController,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please enter Email';
                      }
                      if(!form.setEmail(value))
                      {
                        return 'Invalid email';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Color(0xff888888),fontSize: 20)
                    ),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      TextFormField(
                        style: TextStyle(fontSize: 20,color: Colors.black),
                        obscureText: !_showPass,
                        controller: _passController,
                        validator: (value){
                          if(value.isEmpty){
                            return 'Please enter password';
                          }
                          if(!form.setPass(value)){
                            return 'Invalid pass';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Color(0xff888888),fontSize: 20)
                        ),
                      ),
                      GestureDetector(
                        onTap: onToggleShowPass,
                        child: Text(_showPass?'HIDE':'SHOW',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        onPressed:(){var valid = _formKey.currentState.validate();} ,
                        child: Text('Sign in',
                          style: TextStyle(color: Colors.white,fontSize: 16),),
                      ),
                    ),
                  ),
                  Container(
                    height: 170,
                    child: Row(
                      children: [
                        Container(
                          //margin: EdgeInsets.fromLTRB(left, top, right, bottom),
                          child: Text(
                            'NEW USER SIGN IN',
                            style: TextStyle(color: Color(0xff888888),fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
                          child: Text('FORGOT PASSWORD',style:TextStyle(color: Color(0xff888888),fontSize: 15,fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  )
                ],
              )
          ),
        )

      ),
    );
  }

  void onToggleShowPass()
  {
    setState(() {
      _showPass =!_showPass;
    });
  }
  void onSignClick()
  {
    setState(() {

    });
  }

}