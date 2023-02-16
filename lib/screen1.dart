import 'package:flutter/material.dart';
import 'Screen2.dart';
import 'dart:core';



List<String> yr = [];
String a = '';
class Screen1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Screen1State();
  }
}

class Screen1State extends State<Screen1>{
  var _formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  List<String> _months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  String _selectedMonth = 'January';

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        tileMode: TileMode.mirror,
        colors:
        [
        Colors.lightGreenAccent,
        Colors.cyanAccent,
        Colors.cyanAccent,
        Colors.lightGreenAccent
        ])
    ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Please fill up honestly", textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, shadows: [Shadow(
              offset: Offset(2.5, -2.5), //position of shadow
              blurRadius: 2.0, //blur intensity of shadow
              color: Colors.black.withOpacity(
                  0.5), //color of shadow with opacity
            ),
            ], fontWeight: FontWeight.bold),),
          bottomOpacity: 0.3,
          scrolledUnderElevation: 40.0,
          elevation: 20,
          shape: StadiumBorder(side: BorderSide.none),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.cyanAccent,

          leading: Icon(Icons.person, color: Colors.white, shadows: [Shadow(
            offset: Offset(2.5, -2.5), //position of shadow
            blurRadius: 2.0, //blur intensity of shadow
            color: Colors.blue.withOpacity(
                0.9), //color of shadow with opacity
          ),
          ],),),

        body: Padding(
    padding: EdgeInsets.all(20.0),
    child: Center(
    child: Form(
    key: _formKey,
    child: ListView(
    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
        .onDrag,
    children: <Widget>[
    Text(
    "-" * 47,
    style: TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20.0),
    ),
    SizedBox(
    height: 10.0,
    ),
    Text(
    "A surprise is waiting for you",
    style: TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20.0),
    ),
    SizedBox(
    height: 30.0,
    ),
    TextFormField(
      keyboardType: TextInputType.text,
    enabled: true,
    controller: firstnameController,
    decoration: InputDecoration(
    hintText: "e.g, Ankita",
    labelText: "Enter your name, please",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0))),
    validator: (value) {
    if (value == null || value.isEmpty)
    return "Required";
    },
    ),
      SizedBox(height: 20.0,),
      Text(
        "Enter your Birthday Detalis:",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      SizedBox(height: 20.0,),
        TextFormField(
          keyboardType: TextInputType.datetime,
          enabled: true,
          controller: dateController,
          decoration: InputDecoration(
              hintText: "e.g, 17",
              labelText: "Please enter only the day no. of you birth",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          validator: (value) {
            if (value == null || value.isEmpty)
              return "Required";
          },
        ),SizedBox(height: 20.0,),

      DropdownButton<String>(
        value: _selectedMonth,
        items: _months.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if(newValue != null){
            setState(() {
              _selectedMonth = newValue;
            });
            yr.add(newValue);
          }
        },
      ),
      SizedBox(height: 20.0,),

      TextFormField(
        keyboardType: TextInputType.datetime,
        enabled: true,
        controller: yearController,
        decoration: InputDecoration(
            hintText: "e.g, 1975",
            labelText: "Enter the year",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0))),
        validator: (value) {
          if (value == null || value.isEmpty)
            return "Required";
        },
      ),
      SizedBox(height: 20.0,),
      Row(
        children: <Widget>[
          Expanded(child:
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: ElevatedButton(

                onPressed: () async {
                  await Navigator.push(
                      context, MaterialPageRoute(builder:
                      (BuildContext context) => BirthdayScreen(
                        name: firstnameController.text, age: int.parse(yearController.text)
                      )));
                },
                child: Text("Save & Next", style: TextStyle(
                    color: Colors.white, shadows: [Shadow(
                  offset: Offset(2.5, -2.5),
                  //position of shadow
                  blurRadius: 2.0,
                  //blur intensity of shadow
                  color: Colors.black.withOpacity(
                      0.5), //color of shadow with opacity
                ),
                ]),),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0)
                    )
                )),
          )),


          Expanded(child:
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      firstnameController.text = yearController.text= dateController.text=
                      '';
                    });
                  },
                  child: Text("Reset", style: TextStyle(
                      color: Colors.white, shadows: [Shadow(
                    offset: Offset(2.5, -2.5),
                    //position of shadow
                    blurRadius: 2.0,
                    //blur intensity of shadow
                    color: Colors.black.withOpacity(
                        0.5), //color of shadow with opacity
                  ),
                  ]),),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0)
                      )
                  )
              )),
          ),

        ],
      ),
      SizedBox(height: 20.0),



      ]
    )

    ),

    )
    ),

      )


    );

  }

}