import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_samples/screen_helper.dart';

import 'form_email.dart';

class SignInTest extends StatefulWidget {
  SignInTest({Key key, this.title, String username}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  _MySignInPageStateTest createState() => _MySignInPageStateTest();
}
class _MySignInPageStateTest extends State<SignInTest> {

  TextEditingController username = TextEditingController();
  TextEditingController passController=TextEditingController();
  FormEmail form=FormEmail();
  bool conEmailForm=true;

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
  void _sendDataBack(BuildContext context)
  {
    String txt = username.text;
    //Navigator.pop(context, textToSendBack);
    ScreenHelper.gotoFormWidget(context,username: txt);
  }

  void _validator(String email)
  {
    if(form.setEmail(email)==false)
    {
      setState(() {
        conEmailForm=false;
        // _errorMessage='Invalid email';
      });
    }
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
     /* appBar: AppBar(
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
        ),),*/
      appBar: AppBar(
        title: Text('📖 Story Generator'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: FlatButton(
              textColor: Colors.white,
              child: Text('Submit'),
              onPressed: () {
                // Validate the form by getting the FormState from the GlobalKey
                // and calling validate() on it.
                var valid = _formKey.currentState.validate();
                if (!valid) {
                  return 'TESTING VALIDATION';
                }

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Your story'),
                    content: Text('The adjective developer saw a noun'),
                    actions: [
                      FlatButton(
                        child: Text('Done'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      body: Form(

        key: _formKey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // A text field that validates that the text is an adjective.
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter an adjective.';
                    }
                    if (form.setEmail(value)) {
                      return 'validate';
                    }
                    return 'Not a valid adjective.';
                  },
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'e.g. quick, beautiful, interesting',
                    labelText: 'Enter an adjective',
                  ),
                  onChanged: (value) {
                    form.email = value;
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                // A text field that validates that the text is a noun.
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a noun.';
                    }
                    return 'Not a valid noun.';
                  },
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'i.e. a person, place or thing',
                    labelText: 'Enter a noun',
                  ),
                  onChanged: (value) {
                    form.pass = value;
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                // A custom form field that requires the user to check a
                // checkbox.
                FormField(
                  initialValue: false,
                  validator: (value) {
                    if (value == false) {
                      return 'You must agree to the terms of service.';
                    }
                    return null;
                  },
                  builder: (FormFieldState formFieldState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [

                            Text(
                              'I agree to the terms of service.',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        if (!formFieldState.isValid)
                          Text(
                            formFieldState.errorText ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: Theme.of(context).errorColor),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );

  }

}
