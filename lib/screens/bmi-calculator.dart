import 'package:diet_recommanded_system/Utils/Utils.dart';
import 'package:diet_recommanded_system/Utils/Widget-utils.dart';
import 'package:flutter/material.dart';

import 'bmi-form.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiNumber = 0;
  String BMI = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: WidgetUtils.buildAppBar(context, "BMI Calculator"),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Form(
                    key: _globalKey,
                    child: Column(children: [
                      const SizedBox(height: 30),
                      WidgetUtils.textFormField('Height in cm', 'Height in cm',
                          (v) {
                        if (v!.isEmpty) {
                          return 'required';
                        }
                      }, heightController, textInputType: TextInputType.number),
                      WidgetUtils.textFormField('Weight in KG', 'Weight in KG',
                          (v) {
                        if (v!.isEmpty) {
                          return 'required';
                        }
                      }, weightController, textInputType: TextInputType.number),
                      const SizedBox(height: 10),
                      WidgetUtils.buildRoundBtn('Calculate', () => calculate()),
                      const SizedBox(height: 30),
                    ]),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    WidgetUtils.expandedCard('What is BMI?',
                        'BMI(Body Mass Index) is a measurement of a person leanness or corpulence based on their height and weight, and is intended to quantify tissue mass.\nIt is widely used as a general indicator of whether a person has a healthy body weight for their height. Specifically, the value obtained from the calculation of BMI is used to categorize whether a person is underweight, normal weight, overweight, or obese depending on what range the value falls between.\nThese ranges of BMI vary based on factors such as region and age, and are sometimes further divided into subcategories such as severely underweight or very severely obese. Being overweight or underweight can have significant health effects, so while BMI is an imperfect measure of healthy body weight, it is a useful indicator of whether any additional testing or action is required.'),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Refer to the table below to see the different categories based on BMI that are used by the calculator.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(20.0),
                      child: Table(
                        border: TableBorder.all(color: Colors.black),
                        children: [
                          tableRow('Category', 'BMI range - kg/m2',
                              isColored: true),
                          tableRow('Severe Thinness', '< 15.9'),
                          tableRow('Moderate Thinness', '16 - 16.9'),
                          tableRow('Mild Thinness', '17 - 18.4'),
                          tableRow('Normal', '18.5 - 24.9'),
                          tableRow('Overweight', '25 - 29.9'),
                          tableRow('Obese Class I', '30 - 34.9'),
                          tableRow('Obese Class II', '35 - 39.9'),
                          tableRow('Obese Class III', '> 40'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        '*This is the World Health Organization (WHO) recommended body weight based on BMI values for adults. It is used for both men and women, age 18 or older.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ))
              ],
            )));
  }

  tableRow(String text1, String text2, {bool isColored = false}) {
    return TableRow(
        decoration:
            isColored ? BoxDecoration(color: Colors.blue.shade200) : null,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text1),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text2),
          ),
        ]);
  }

  calculate() {
    if (_globalKey.currentState!.validate()) {
      double hg = Utils.stringToDouble(heightController.text) / 100;
      double bmi = Utils.stringToDouble(weightController.text) / (hg * hg);
      if (bmi < 16) {
        setState(() {
          bmiNumber = bmi;
          BMI = 'Severe Thinness (Underweight)';
        });
      } else if (bmi >= 16 && bmi <= 17) {
        setState(() {
          bmiNumber = bmi;
          BMI = 'Moderate Thinness (Underweight)';
        });
      } else if (bmi >= 17 && bmi <= 18.5) {
        setState(() {
          bmiNumber = bmi;
          BMI = 'Mild Thinness (Underweight)';
        });
      } else if (bmi >= 18.6 && bmi <= 24.9) {
        setState(() {
          bmiNumber = bmi;
          BMI = 'Normal Weight';
        });
      } else if (bmi >= 25 && bmi <= 29.9) {
        setState(() {
          bmiNumber = bmi;
          BMI = 'Overweight';
        });
      } else if (bmi <= 30 && bmi >= 34.9) {
        setState(() {
          bmiNumber = bmi;
          BMI = 'Obese Class I (Overweight)';
        });
      } else if (bmi <= 35 && bmi >= 39.9) {
        setState(() {
          bmiNumber = bmi;
          BMI = 'Obese Class II (Overweight)';
        });
      } else if (bmi >= 40) {
        setState(() {
          bmiNumber = bmi;
          BMI = 'Obese Class III (Overweight)';
        });
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BMIForm(bmi: bmiNumber, category: BMI)));
    }
  }
}
