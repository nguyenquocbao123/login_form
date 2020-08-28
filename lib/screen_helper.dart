import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_samples/sign_in.dart';
import 'package:login_samples/validation.dart';

import 'form_widget.dart';
import 'my_story_generator.dart';

class ScreenHelper {
  static gotoStory(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyStoryGenerator()));
  }

  static gotoLogin(BuildContext context, {String username}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignIn(username: username)));
  }

  static gotoFormWidget(BuildContext context,{String username}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyForm(username: username)));
  }

  static gotoValidation(BuildContext context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>FormValidationDemo() ));
  }
  /* static gotoMyHomePageStage(BuildContext context,{String username}){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>_MyFormPageState(username: username)));
  }*/

  ScreenHelper();
}