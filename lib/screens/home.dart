import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double bmi_result = 0;
  String _textResult = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(
                fontSize: 25.0,
                color: accentHexColor,
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0, //not have shadow effects
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 130.0,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 42.0,
                        color: accentHexColor,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                            fontSize: 42.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 130.0,
                    child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 42.0,
                        color: accentHexColor,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight",
                          hintStyle: TextStyle(
                            fontSize: 42.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8),
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  double _h = _heightController.text.isNotEmpty
                      ? double.parse(_heightController.text)
                      : 0.00;
                  double _w = _weightController.text.isNotEmpty
                      ? double.parse(_weightController.text)
                      : 0.00;

                  setState(() {
                    bmi_result = _w / (_h * _h);
                    if ((_h <= 0) || (_w <= 0)) {
                      bmi_result = 0.0;
                      _textResult = " ";
                    } else if (bmi_result > 25) {
                      _textResult = "You're over weight!";
                    } else if (bmi_result >= 18.5 && bmi_result <= 25) {
                      _textResult = "You're normal weight!";
                    } else {
                      _textResult = "You're under weight!";
                    }
                  });
                },
                child: Container(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor,
                    ),
                  ),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    border: Border.all(
                      color: Colors.white70,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                child: Text(
                  bmi_result.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Visibility(
                visible: _textResult.isNotEmpty,
                child: Container(
                  child: Text(
                    _textResult,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: accentHexColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 70,
              ),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 0,
              ),
              RightBar(barWidth: 70),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 70),
            ],
          ),
        ));
  }
}
