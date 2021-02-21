import 'package:flutter/material.dart';
import 'dart:math';
import 'package:splashscreen/splashscreen.dart';
import 'package:lottie/lottie.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFFCFBF5),
        scaffoldBackgroundColor: Color(0xFFFCFBF5),
      ),
      home: Splash2(),
    );
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new homescreen(),
      image: Image.asset('assets/ecg.png'),
      photoSize: 150.0,
      loaderColor: Colors.black
    );
  }
}






class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {

  String height = '180';
  String weight = '60';
  String  bmi = '18.5';
  String cat = 'Normal';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 10,top:50),
              child: Text('You are $cat ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'heading',
                ),
              )

          ),
      Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 10,right: 10,bottom: 0,top:0),
          child: Text('Your BMI is ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'heading',
            ),
          )

          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10,right: 10,bottom: 0,top:0),
              child: Text('$bmi',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 100,
                  fontFamily: 'heading',
                ),
              ),

          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10,right: 10,bottom: 15,top:0),
            child:Lottie.asset(
              'assets/5683-health-cycling.json',
              height: MediaQuery.of(context).size.width*0.3,
              repeat: true,
              reverse: false,
              animate: true,
            ),

          ),
             Container(
               padding: EdgeInsets.all(10),
               margin: EdgeInsets.only(left: 10,right: 10,bottom: 10,top:0),
               decoration: BoxDecoration(
                 color: Colors.black,
                 borderRadius: BorderRadius.circular(10.0),
               ),
                 child:Column(
                   children: <Widget> [
                     Text('HEIGHT',
                       style: TextStyle(
                           fontSize: 15,
                           letterSpacing: 1,
                           color: Colors.grey,
                         fontFamily: 'heading',
                       ),
                     ),
                     Text('$height cm',
                       style: TextStyle(
                         fontSize: 20,
                         fontFamily: 'heading',
                       ),
                     ),
                     SliderTheme(
                       data: SliderTheme.of(context).copyWith(
                         inactiveTrackColor: Color(0xFF8D8E98),
                         activeTrackColor: Colors.white,
                         thumbColor: Color(0xFFFCFBF5),
                         overlayColor: Color(0x00FCFBF5),
                         thumbShape:
                         RoundSliderThumbShape(enabledThumbRadius: 15.0),
                         overlayShape:
                         RoundSliderOverlayShape(overlayRadius: 30.0),
                       ),
                       child: Slider(
                         value: double.parse(height),
                         min: 120.0,
                         max: 220.0,
                         onChanged: (double newValue) {
                           setState(() {
                             height = newValue.toStringAsFixed(1);
                             bmi = calculateBMI(height,weight);
                             cat = category(bmi);
                           });
                         },
                       ),
                     ),
                   ],
                 ),
            ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10,right: 10,bottom:50,top:10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:Column(
              children: <Widget> [
                Text('HEIGHT',
                style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 1,
                  color: Colors.grey,
                  fontFamily: 'heading',
                ),
                ),
                Text('$weight kg',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'heading',
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFFCFBF5),
                    overlayColor: Color(0x00FCFBF5),
                    thumbShape:
                    RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                    RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: double.parse(weight),
                    min: 0.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        weight = newValue.toStringAsFixed(1);
                        bmi = calculateBMI(height,weight);
                        cat = category(bmi);
                      });
                    },
                  ),
                ),
              ],
            )

          )
        ],
      ),

    );
  }
  String category(String bmi)
  {
   double _bmi = double.parse(bmi);
    if (_bmi >= 25 && _bmi<30) {
      return 'Overweight!';
    }
    else if (_bmi > 18.5 && _bmi<25) {
      return 'Normal';
    }
    else if (_bmi > 30) {
      return 'Obese!';
    } else {
      return 'Underweight!';
    }
  }
  String calculateBMI(String height,String weight) {
    double h = double.parse(height);
    double w = double.parse(weight);
    double x = (w / pow(h / 100, 2));
    return x.toStringAsFixed(1);
  }
}