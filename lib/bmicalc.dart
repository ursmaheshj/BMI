import 'package:flutter/material.dart';
import 'constants.dart';
import 'repeatcode.dart';
import 'result.dart';
import 'bmibrain.dart';

enum Gender { male, female }

class Bmicalc extends StatefulWidget {
  const Bmicalc({Key? key}) : super(key: key);

  @override
  _BmicalcState createState() => _BmicalcState();
}

class _BmicalcState extends State<Bmicalc> {
  Gender? selectedGender;
  int height = 180;
  int weight = 45;
  int age = 22;
  // Color maleCardColor = inkActiveCardColor;
  // Color femaleCardColor = inkActiveCardColor;

  // void updateColor(Gender genderSelected) {
  //   if (genderSelected == Gender.male) {
  //     maleCardColor = kActiveCardColor;
  //     femaleCardColor = inkActiveCardColor;
  //   }
  //   if (genderSelected == Gender.female) {
  //     femaleCardColor = kActiveCardColor;
  //     maleCardColor = inkActiveCardColor;
  //   }
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild:
                          const TopCard(topIcon: Icons.male, topTitle: 'Male'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const TopCard(
                          topIcon: Icons.female, topTitle: 'Female'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kTextSyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberSyle,
                      ),
                      const Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        overlayColor: Colors.white24,
                        thumbColor: Colors.pink,
                        inactiveTrackColor: Colors.white,
                        activeTrackColor: Colors.pink[200]),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 300,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kTextSyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberSyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(Icons.remove, () {
                              setState(() {
                                weight--;
                              });
                            }),
                            RoundIconButton(
                              Icons.add,
                              () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kTextSyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberSyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              Icons.remove,
                              () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              Icons.add,
                              () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.red, padding: const EdgeInsets.all(10)),
            child: const Text(
              'CALCULATE',
              style: TextStyle(fontSize: 30),
            ),
            onPressed: () {
              BMICalculator calc =
                  BMICalculator(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  Result(
                    resultText: calc.calculateBMI(),
                    bmiResult: calc.getResult(),
                    interpretation: calc.interpretation(),

                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
