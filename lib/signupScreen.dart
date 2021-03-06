import 'package:flutter/material.dart';
import 'routeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/recommendation_activity.dart';
import 'recommendation.dart';
import 'package:flutter/cupertino.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage(
      {Key key,
      this.title,
      this.recommendationActivity,
      this.foodRecommendation})
      : super(key: key);

  final String title;
  RecommendationActivity recommendationActivity;
  Recommendation foodRecommendation;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  _SignUpPageState() {
    loadProfileInfo();
    print(_gender);
  }

  var idTextFieldController = new TextEditingController();
  var weightTextFieldController = new TextEditingController();
  var heightTextFieldController = new TextEditingController();
  var headTextFieldController = new TextEditingController();
  var _gender = "";
  var ageTextFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Container(),
        backgroundColor: Color.fromRGBO(255, 180, 105, 100),
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 235, 222, 100),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Text(
                          "ID",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(
                            right: 30, left: 30, top: 15, bottom: 15),
                        child: TextField(
                          controller: idTextFieldController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'ID',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Text(
                          "Weight",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(
                            right: 30, left: 30, top: 15, bottom: 15),
                        child: TextField(
                          controller: weightTextFieldController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Weight',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Text(
                          "Height",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(
                            right: 30, left: 30, top: 15, bottom: 15),
                        child: TextField(
                          controller: heightTextFieldController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Height',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Text(
                            "Gender",
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          groupValue: _gender,
                          title: Text('Female', textScaleFactor: 0.9),
                          value: 'Female',
                          onChanged: (val) {
                            setState(() {
                              _gender = val;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          groupValue: _gender,
                          title: Text('Male', textScaleFactor: 0.9,),
                          value: 'Male',
                          onChanged: (val) {
                            setState(() {
                              _gender = val;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Text(
                          "Age",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(
                            right: 30, left: 30, top: 15, bottom: 0),
                        child: TextField(
                          controller: ageTextFieldController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Age',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex:2,

                child: Padding(
                  padding: const EdgeInsets.only(top:20,bottom:70),
                  child: FlatButton(
                    onPressed: () {
                      print(idTextFieldController.text.toString());
                      saveProfileInfo();
                      print(weightTextFieldController.text.toString());
                      print(heightTextFieldController.text.toString());
                      print(headTextFieldController.text.toString());
                      print(_gender);
                      print(ageTextFieldController.text.toString());
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => RoutePage(
                                  title: 'Third Page',
                                  recommendationActivity:
                                      widget.recommendationActivity,
                                  foodRecommendation: widget.foodRecommendation,
                                )),
                      );
                    },
                    child: const Text('Next', style: TextStyle(fontSize: 20)),

                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 2)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  loadProfileInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = await prefs.get("ID");
    idTextFieldController.text = id;
    String weight = await prefs.get("weight");
    weightTextFieldController.text = weight;
    String height = await prefs.get("height");
    heightTextFieldController.text = height;
    String head = await prefs.get("head");
    headTextFieldController.text = head;
    String gender = await prefs.get("gender");
    setState(() {
      _gender = gender;
    });
    String age = await prefs.get("age");
    ageTextFieldController.text = age;
  }

  saveProfileInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("ID", idTextFieldController.text.toString());
    await prefs.setString("weight", weightTextFieldController.text.toString());
    await prefs.setString("height", heightTextFieldController.text.toString());
    await prefs.setString("head", headTextFieldController.text.toString());
    await prefs.setString("gender", _gender);
    await prefs.setString("age", ageTextFieldController.text.toString());
    await prefs.setBool("saved", true);
  }
}
