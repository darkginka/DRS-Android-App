import 'package:diet_recommanded_system/Utils/Widget-utils.dart';
import 'package:flutter/material.dart';

class BMIForm extends StatefulWidget {
  const BMIForm({
    Key? key,
    required this.bmi,
    required this.category,
  }) : super(key: key);
  final double bmi;
  final String category;

  @override
  _BMIFormState createState() => _BMIFormState();
}

class _BMIFormState extends State<BMIForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: WidgetUtils.buildAppBar(context, "BMI Calculator"),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    const SizedBox(height: 30),
                    row('You are : ', widget.category),
                    const SizedBox(height: 10),
                    row('Your BMI index is : ',
                        widget.bmi.toString().substring(0, 5)),
                    const SizedBox(height: 30),
                  ],
                )),
                widget.bmi >= 25
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: Card(
                            child: Container(
                                color: Colors.lightBlue.shade50,
                                width: MediaQuery.of(context).size.width * .9,
                                child: Column(
                                  children: const [
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Risks associated with being overweight',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                          'Being overweight increases the risk of a number of serious diseases and health conditions. Below is a list of said risks, according to the Centers for Disease Control and Prevention (CDC):\n\n1) High blood pressure.\n\n2) Higher levels of LDL cholesterol, which is widely considered "bad cholesterol," lower levels of HDL cholesterol, considered to be good cholesterol in moderation, and high levels of triglycerides.\n\n3) Type II diabetes.\n\n4) Coronary heart disease.\n\n5) Do not Share your Drugs or advice treatment to others.\n\n6) Stroke.\n\n7) Gallbladder disease.\n\n8) Osteoarthritis, a type of joint disease caused by breakdown of joint cartilage.\n\n9) Sleep apnea and breathing problems.\n\n10) Certain cancers (endometrial, breast, colon, kidney, gallbladder, liver).\n\n11) Low quality of life.\n\n12) Mental illnesses such as clinical depression, anxiety, and others.\n\n13) Body pains and difficulty with certain physical functions.'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                          'As can be seen from the list above, there are numerous negative, in some cases fatal, outcomes that may result from being overweight. Generally, a person should try to maintain a BMI below 25 kg/m2, but ideally should consult their doctor to determine whether or not they need to make any changes to their lifestyle in order to be healthier.'),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                )),
                          ),
                        ),
                      )
                    : widget.bmi <= 18.5
                        ? SliverToBoxAdapter(
                            child: Center(
                              child: Card(
                                child: Container(
                                    color: Colors.lightBlue.shade50,
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    child: Column(
                                      children: const [
                                        SizedBox(height: 20),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Risks associated with being underweight',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                              'Being underweight has its own associated risks, listed below:\n\n1) Malnutrition, vitamin deficiencies, anemia (lowered ability to carry blood vessels).\n\n2) Osteoporosis, a disease that causes bone weakness, increasing the risk of breaking a bone.\n\n3) A decrease in immune function.\n\n4) Growth and development issues, particularly in children and teenagers.\n\n5) Possible reproductive issues for women due to hormonal imbalances that can disrupt the menstrual cycle. Underweight women also have a higher chance of miscarriage in the first trimester.\n\n6) Potential complications as a result of surgery.'),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                              'In some cases, being underweight can be a sign of some underlying condition or disease such as anorexia nervosa, which has its own risks. Consult your doctor if you think you or someone you know is underweight, particularly if the reason for being underweight does not seem obvious.'),
                                        ),
                                        SizedBox(height: 20),
                                      ],
                                    )),
                              ),
                            ),
                          )
                        : SliverToBoxAdapter(
                            child: Center(
                              child: Card(
                                child: Container(
                                    color: Colors.lightBlue.shade50,
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    child: Column(
                                      children: const [
                                        SizedBox(height: 20),
                                        Text(
                                          'You are normal.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        SizedBox(height: 30),
                                      ],
                                    )),
                              ),
                            ),
                          ),
              ],
            )));
  }

  row(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          key,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        Text(
          value,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: widget.bmi >= 18.5 && widget.bmi <= 24.9
                  ? Colors.green
                  : Colors.red),
        ),
      ],
    );
  }
}
