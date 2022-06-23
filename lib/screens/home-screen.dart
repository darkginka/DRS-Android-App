import 'package:diet_recommanded_system/Utils/Widget-utils.dart';
import 'package:diet_recommanded_system/screens/bmi-calculator.dart';
import 'package:diet_recommanded_system/screens/news-screen.dart';
import 'package:diet_recommanded_system/screens/prediction-page.dart';
import 'package:flutter/material.dart';
import 'nutrition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () => Future(() => false),
      child: Scaffold(
          appBar: WidgetUtils.buildAppBar(context, "Food App", icon: null),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    card("Predict Food", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PredictionScreen()));
                    }, 'assets/images/drs.jpg'),
                    const SizedBox(width: 20),
                    card("Nutrition Advice", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NutritionAdvice()));
                    }, 'assets/images/nutrition.png'),
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    card("BMI calculator", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BMICalculator()));
                    }, 'assets/images/bmi.png'),
                    const SizedBox(width: 20),
                    card("Health News", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewsScreen()));
                    }, 'assets/images/news.png')
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          )),
    ));
  }

  Widget card(String label, Function()? onTap, String imgPath) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.lightBlue.shade50,
        elevation: 5,
        child: SizedBox(
          height: height * .2,
          width: width * .4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: height * .12,
                  width: width * .28,
                  child: Image.asset(imgPath, fit: BoxFit.fill)),
              const SizedBox(height: 20),
              FittedBox(
                  child: Text(
                label,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
