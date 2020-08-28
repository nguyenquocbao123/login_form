import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_samples/screen_helper.dart';
import 'form_email.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key, this.title, String username}) : super(key: key);
//check command github branch
  final String title;

  @override
  _MySignInPageState createState() => _MySignInPageState();
}
class _MySignInPageState extends State<SignIn> {
  int _counter = 0;
  TextEditingController username = TextEditingController();
  TextEditingController passController=TextEditingController();
  FormEmail form=FormEmail();
  bool conEmailForm=true;
  var _erroEmail='Invalid email';
  var errorPass='nothing';
  var _userInvalid=false;
  var _passInvalid=false;
  final _formKey = GlobalKey<FormState>();

  void _showDialog(String message)
  {
    showDialog
      (
      context: context,
      child: AlertDialog
        (
        title: Text(message),
        actions: [
          FlatButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(

          icon: const Icon(Icons.arrow_back),
          onPressed: () { ScreenHelper.gotoLogin(context); },

        ),
        backgroundColor: Color(0xff009688),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          children: [
            Container(
                padding: EdgeInsets.only(left: 30),
                child: Text('Sign in Form')),
          ],
        ),),

      body: Form(
        key: _formKey,
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Scrollbar(
            child:SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child:Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 22),
                      child: TextFormField(
                        controller: username,
                        validator: (value){
                          if(value.isEmpty){
                            return 'Please enter Email';
                          }
                          if(form.setEmail(value)){
                            return null;
                          }
                          return ' Invalid email';
                        },
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Your email address',
                          labelText: 'Email',
                        ),
                        onChanged: (value){
                          form.setEmail(value);

                        },
                      ),
                    ),

                    Container(
                      //margin: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: passController,
                        validator: (value){
                          if(value.isEmpty){
                            return 'Enter password';
                          }
                          if(value!=username.text){
                            return 'Invalid Password';
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Password',

                        ),

                        onChanged: (value){
                          form.pass=value;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                            onPressed: (){
                              var valid = _formKey.currentState.validate();
                              if(form.Condition()==true){
                                _showDialog('Succesfully signed in.');
                                ScreenHelper.gotoValidation(context);
                              }
                              else{
                                _showDialog('Try again!!!!Enter password as email');
                              }

                            },
                            child:Text('Sign in',style: TextStyle(fontWeight: FontWeight.bold),),)
                        ],
                      ),
                    ),

                  ],
                )
            )

        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );

  }

}
