import 'package:bmi_claculator_og/methods/CALbmi.dart';
import 'package:bmi_claculator_og/screens/resultScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//local
import 'package:bmi_claculator_og/components/reusableCard.dart';
import '../components/iconWithLabel.dart';
import '../components/roundBTN.dart';

enum GenderSelection { Male, Female }

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final inActiveColor = Color(0xff1d1e33); // fixed color value
  final activeColor = Color(0xff1d1e33); // fixed color value
  GenderSelection selection = GenderSelection.Male; // initialized with a default value
  int _height = 150;
  int _weight = 65;
  int _age = 17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI CALCULATOR")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  reuseableCard(
                    color: selection == GenderSelection.Male ? activeColor : inActiveColor,
                    myChild: iconWithLabel(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onpress: () {
                      setState(() {
                        selection = GenderSelection.Male;
                      });
                    },
                  ),
                  reuseableCard(
                    color: selection == GenderSelection.Male ? inActiveColor : activeColor,
                    myChild: iconWithLabel(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onpress: () {
                      setState(() {
                        selection = GenderSelection.Female;
                      });
                    },
                  ),
                ],
              ),
            ),
            reuseableCard(
              color: Color(0xff1d1e33),
              myChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text("HEIGHT"),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          _height.toString(),
                          style: TextStyle(fontSize: 47, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text('  cm'),
                      ),
                    ],
                  ),
                  Container(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 2,
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x15eb1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        max: 220,
                        min: 120,
                        onChanged: (double newValue) {
                          setState(() {
                            _height = newValue.toInt().round();
                          });
                        },
                        value: _height.toDouble(),
                      ),
                    ),
                  ),
                ],
              ),
              onpress: () {},
            ),
            Expanded(
              child: Row(
                children: [
                  reuseableCard(
                    color: Color(0xff1d1e33),
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("WEIGHT"),
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Container(
                              child: Text(
                                _weight.toString(),
                                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text('  kg'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedBTN(
                              color: Color(0xff0A0E21),
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  _weight++;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            RoundedBTN(
                              color: Color(0xff0A0E21),
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  _weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onpress: () {},
                  ),
                  reuseableCard(
                    color: Color(0xff1d1e33),
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("AGE"),
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Container(
                              child: Text(
                                _age.toString(),
                                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text('  yr'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedBTN(
                              color: Color(0xff0A0E21),
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  _age++;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            RoundedBTN(
                              color: Color(0xff0A0E21),
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  _age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onpress: () {},
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                CalculateBMI calculateBMI =
                CalculateBMI(height: _height, weight: _weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => Resultscreen(
                      bmi: calculateBMI.calculateBMI(),
                      result: calculateBMI.getResult(),
                      feedback: calculateBMI.feedBack(),
                    ),
                  ),
                );
              },
              child: Text("CALCULATE"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

