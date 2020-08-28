import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:login_samples/screen_helper.dart';

class MyForm extends StatefulWidget {
  final String title;
  final String username;
  MyForm({Key key, this.title,this.username}) : super(key: key);



  @override
  _MyFormPageState createState() => _MyFormPageState(username);
}

class _MyFormPageState extends State<MyForm> {
  double maxValue = 0;
  bool brushedTeeth = false;
  bool enableFeature = false;
  String username;
  DateTime date = DateTime.now();
  _MyFormPageState(this.username);




  @override
  Widget build(BuildContext context) {
    //widget.username;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ScreenHelper.gotoLogin(context, username: username);
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xff009688),
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text('Form widgets'),
            )
          ],
        ),
      ),
      body: Form(
        child: Scrollbar(
          child: SingleChildScrollView(
            //child:Align(
            //alignment: Alignment.topCenter,
            // padding: EdgeInsets.all(16),
              child: Container(
                color: Colors.white,
                height: 550,
                child: Column(
                  children: <Widget>[
                    Container(
                      // margin: EdgeInsets.all(22),
                      margin: EdgeInsets.only(top: 22, left: 22, right: 22),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Title',
                          hintText: '$username',
                        ),
                      ),
                    ),
                    Container(
                      //height: 100,
                      margin: EdgeInsets.only(top: 30, left: 22, right: 22),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Desciption',
                          isDense: true,
                          // helperMaxLines: 100,
                        ),
                      ),
                    ),
                    Container(

                      padding: EdgeInsets.only(top: 32, bottom: 10,left: 22),
                      child: _FormDatePicker(
                        date: date,
                        onChanged: (value) {
                          setState(() {
                            date = value;
                          });
                        },
                      ),

                    ),
                    Container(

                      //alignment: Alignment.topLeft,
                     // margin: EdgeInsets.only(top: 10, left:10),
                      margin: EdgeInsets.only(right: 220),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  'Estimate Value',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 100,left: 30),
                                  child: Text('\$$maxValue')),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 380,
                      child: Slider(

                        min: 0,
                        max: 500,
                        divisions: 500,
                        value: maxValue,
                        onChanged: (value) {
                          setState(() {
                            maxValue = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: brushedTeeth,
                            onChanged: (checked) {
                              setState(() {
                                brushedTeeth = checked;
                              });
                            },
                          ),
                          Text('Brushed Teeth',
                              style: Theme.of(context).textTheme.subtitle1),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Text(
                                'Enable feature',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          Container(
                            margin: EdgeInsets.only(right: 22),
                            child: Switch(
                              value: enableFeature,
                              onChanged: (enabled) {
                                setState(() {
                                  enableFeature = enabled;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
    throw UnimplementedError();
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged onChanged;

  _FormDatePicker({
    this.date,
    this.onChanged,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,
            ),
            Container(
              //padding: EdgeInsets.only(left: 10),
              child: Text(

                intl.DateFormat.yMd().format(widget.date),
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1,
              ),
            ),
          ],
        ),
        FlatButton(
          child: Text('Edit'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }

            widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}
