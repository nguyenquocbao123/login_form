import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart' as english_words;
import 'package:login_samples/screen_helper.dart';
class MyStoryGenerator extends StatefulWidget {
  MyStoryGenerator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyStoryGeneratorPageState createState() => _MyStoryGeneratorPageState();
}

class _MyStoryGeneratorPageState extends State<MyStoryGenerator> {
  bool check = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            ScreenHelper.gotoFormWidget(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Color(0xff009688),
        title: Row(
          children: [
            //Icon(Icons.bookmark)
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text('📖Story Generator'),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: FlatButton(
              textColor: Colors.white,
              child: Text('Submit'),
              onPressed: (){
                 var valid= _formKey.currentState.validate();
                 if(!valid){
                   return;
                 }
              },
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: SingleChildScrollView(
            //child:Align(
            //alignment: Alignment.topCenter,
            // padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Container(
                    // margin: EdgeInsets.all(22),
                    margin: EdgeInsets.only(top: 22, left: 22, right: 22),
                    child: TextFormField(
                      validator:(value){
                        if(value.isEmpty){
                          return 'Please enter a noun';
                        }
                        if(english_words.nouns.contains(value)){
                          return null;
                        }
                        return 'Not a valid noun';
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'e.g. quick, beautiful, interesting',
                        labelText: 'Enter an adjective',
                      ),
                    ),
                  ),
                  Container(
                    //height: 100,
                    margin: EdgeInsets.only(top: 30, left: 22, right: 22),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'i.e. a person, place or thing',
                        labelText: 'Enter a noun',
                        isDense: true,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: check,
                          onChanged: (checked) {
                            setState(() {
                              check = checked;
                            });
                          },
                        ),
                        Text('I agree to the terms of service.'),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}