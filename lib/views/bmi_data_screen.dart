import 'package:bmi_flutter/constants/constant.dart';
import 'package:bmi_flutter/helpers/bmi_calculator.dart';
import 'package:bmi_flutter/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  List<Widget> generateList(int start, int end) {
    List<Widget> weights = [];
    for (var i = start; i < end; i++) {
      weights.add(Text(
        '$i',
        style: labelTextStyle.copyWith(
          fontSize: 20,
        ),
      ));
    }

    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        elevation: 0,
        title: const Text('BMI Calculator'),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          final bmiCalculater =
          BmiCalculator(height: height, weight: weight);
          bmiCalculater.calculateBmi();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) {
                return BmiResultScreen(
                  bmi: bmiCalculater.bmi!,
                );
              }),
            ),
          );
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color(0xffd2d2d2),
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2,
              )
            ],
            color: primaryBlueColor,
          ),
          child: const Center(
            child: Text(
              'Calculate BMI',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = 'male';
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == 'male') ? primaryBlueColor : Colors.white,
                      child: Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: GenderIconText(
                                icon: Icons.male,
                                title: 'Male',
                                iconColor: (gender == 'male') ? primaryBlueColor : primaryColor,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == 'male') ? primaryBlueColor : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = 'female';
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == 'female') ? primaryBlueColor : Colors.white,
                      child: Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: GenderIconText(
                                icon: Icons.female,
                                title: 'Female',
                                iconColor: (gender == 'female') ? primaryBlueColor : primaryColor,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == 'female') ? primaryBlueColor : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                Text(
                  'HEIGHT',
                  style: labelTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: BmiCard(
                        child: Slider(
                            value: height.toDouble(),
                            min: 80,
                            max: 200,
                            thumbColor: primaryBlueColor,
                            activeColor: primaryBlueColor.withOpacity(0.2),
                            onChanged: (value) {
                              height = value.toInt();
                              setState(() {});
                            }),
                      ),
                    ),
                    BmiCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 15.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '$height',
                              style: labelTextStyle,
                            ),
                            Text(
                              ' cm',
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'WEIGHT (kg)',
                        style: labelTextStyle,
                      ),
                      BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: CupertinoPicker(
                                scrollController: FixedExtentScrollController(
                                    initialItem: 30),
                                itemExtent: 25,
                                magnification: 2,
                                useMagnifier: true,
                                selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent),
                                onSelectedItemChanged: (val) {
                                  weight = val + 20;
                                },
                                children: generateList(20, 220),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'AGE (year)',
                        style: labelTextStyle,
                      ),
                      BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: CupertinoPicker(
                                scrollController:
                                    FixedExtentScrollController(initialItem: 5),
                                itemExtent: 25,
                                magnification: 2,
                                useMagnifier: true,
                                selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent),
                                onSelectedItemChanged: (val) {
                                  age = val + 20;
                                },
                                children: generateList(15, 90),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = Colors.white,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(-2,2),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor!),
      ),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: iconColor,
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
