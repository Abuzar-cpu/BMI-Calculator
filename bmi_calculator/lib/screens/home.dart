import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<StatefulWidget> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _barResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 130,
                      child: TextField(
                          controller: _heightController,
                          style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: accentHexColor),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Height",
                              hintStyle: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(.8))))),
                  Container(
                      width: 130,
                      child: TextField(
                          controller: _weightController,
                          style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: accentHexColor),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Weight",
                              hintStyle: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(.8))))),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);

                  setState(() {
                    _barResult = _w / (_h * _h);
                    if(_barResult > 25){
                      _textResult = "You\'re over weight";
                    }
                    else if(_barResult >= 18.5 && _barResult <= 25){
                      _textResult = "Your weight is normal";
                    }
                    else{
                      _textResult = "You\'re under weight";
                    }
                  });
                },
                child: Text("Calculate",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: accentHexColor)),
              ),
              SizedBox(height: 30),
              Container(
                  child: Text(_barResult.toStringAsFixed(2),
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: accentHexColor))),
              SizedBox(height: 30),
              Visibility(
                visible: _textResult.isNotEmpty,
                child: Container(
                    child: Text(_textResult,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: accentHexColor))),
              ),
              SizedBox(height: 10),
              LeftBar(barWidth: 20),
              SizedBox(height: 10),
              LeftBar(barWidth: 90),
              SizedBox(height: 10),
              LeftBar(barWidth: 40),
              SizedBox(height: 10),
              RightBar(barWidth: 35),
              SizedBox(height: 40),
              RightBar(barWidth: 50),
            ],
          ),
        ));
  }
}
