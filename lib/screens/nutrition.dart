import 'package:diet_recommanded_system/Utils/Widget-utils.dart';
import 'package:diet_recommanded_system/screens/view-news.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NutritionAdvice extends StatefulWidget {
  const NutritionAdvice({Key? key}) : super(key: key);

  @override
  _NutritionAdviceState createState() => _NutritionAdviceState();
}

class _NutritionAdviceState extends State<NutritionAdvice> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: WidgetUtils.buildAppBar(context, "Nutrition Advice"),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Center(
                        child: Card(
                          child: Container(
                              color: Colors.blue.shade50,
                              width: MediaQuery.of(context).size.width * .9,
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  const Text(
                                    "Food",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: RichText(
                                        text: const TextSpan(
                                            text:
                                                'There is no special food that is required by a person with TB. A person with TB does not need special food, although they they should try and have a balanced diet.',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Quicksand'),
                                            children: [
                                          TextSpan(
                                              text:
                                                  '\n\nSome people with TB believe that more expensive foods are better than less expensive ones. This is not true. For example, it is not true that expensive varieties of rice are better than cheaper ones.'),
                                          TextSpan(
                                              text:
                                                  '\n\nThere are also no foods that can cure TB. Some people say that foods such as vinegar can cure TB but this is not correct. It is only TB drugs that can cure TB.'),
                                          TextSpan(
                                              text:
                                                  '\n\nIt is often better that a person with TB has the same diet as normal but possibly with some changes being made to increase their intake of food. People with TB often have a poor appetite initially, but having more frequent food intake can be helpful.'),
                                          TextSpan(
                                              text:
                                                  '\n\nWithin a few weeks of starting TB treatment, the person’s appetite should increase and come back to normal. A person with TB should aim to have three meals and three snacks each day to increase the amount of food they eat.'),
                                        ])),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: WidgetUtils.expandedCard(
                            "A healthy balanced diet for a person with TB.",
                            'A person with TB should aim to have a healthy balanced diet. A healthy balanced diet can be achieved by having foods from four basic food groups. These are:\n\n  1) Cereals, millets and pulses.\n\n  2) Vegetables and fruits.\n\n  3) Milk and milk products, meat, eggs & fish.\n\n  4) Oils, fats and nuts and oils seeds.\n\nA food group is a collection of foods that share similar nutritional properties. If the food eaten contains food from all the above food groups, then the diet is considered healthy. Not all the food groups need to be eaten at every meal.'),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Essential nutrients',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 15, 20, 5),
                          child: Text(
                              '1) An essential nutrient is a nutrient that must be provided by a person’s diet. These nutrients are necessary for the body to function properly. The six essential nutrients include carbohydrates, protein, fat, vitamins, minerals & water.'),
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            tableRow('', 'Major Nutrients', 'Foods',
                                isColored: true),
                            tableRow(
                                'Energy rich foods',
                                'Carbohydrates & fats',
                                'Whole grain cereals, millets'),
                            tableRow('', '', 'Vegetable oils, ghee, butter'),
                            tableRow('', '', 'Nuts and oil seeds. Sugars'),
                            tableRow('Body building foods', 'Proteins',
                                'Pulses, nuts and some oilseeds'),
                            tableRow('', '', 'Milks & milk products'),
                            tableRow('', '', 'Meat, fish, poultry'),
                            tableRow('Protective foods', 'Vitamins & minerals',
                                'Green leafy vegatables'),
                            tableRow('', '', '	Other vegetables & fruits'),
                            tableRow('', '',
                                'Eggs, milk & milk products and flesh foods'),
                          ],
                        ),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 15, 20, 5),
                          child: Text(
                            '2) Nutrition means looking at the nutrients that are provided by people’s diets. For a long time it has been known that there is a link between TB & malnutrition. If people do not have sufficient nutrition, sometimes referred to as under nutrition, then this makes TB worse.  Under nutrition weakens the body’s ability to fight disease.',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RichText(
                            text: TextSpan(
                                text:
                                    '2) Nutrition means looking at the nutrients that are provided by people’s diets. For a long time it has been known that there is a link between TB & malnutrition. If people do not have sufficient nutrition, sometimes referred to as under nutrition, then this makes TB worse.  Under nutrition weakens the body’s ability to fight disease.',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand'),
                                children: [
                              const TextSpan(
                                  text:
                                      '\n\n3) TB also makes under nutrition worse. Most individuals with TB experience weight loss. This can be caused by several factors including reduced food intake due to loss of appetite.In India a '),
                              TextSpan(
                                  text: 'Direct Benefit Transfer ',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ViewNews(
                                                    url:
                                                        'https://tbcindia.gov.in/index1.php?lang=1&level=1&sublinkid=4802&lid=3316',
                                                    title: 'tbcindia.gov.in',
                                                  )));
                                    },
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline)),
                              const TextSpan(
                                  text:
                                      'scheme provides people with TB with additional money for food.')
                            ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: WidgetUtils.expandedCard(
                            "What food should be avoided by a person with TB?",
                            '1) Alcohol in any form, as it increases the risk of drug toxicity.\n\n2) Carbonated drinks.\n\n3) Excess of tea and coffee, or their intake with food.\n\n4) Tobacco and tobacco products.\n\n5) An excess of spices & salt.'),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                )
              ],
            )));
  }

  tableRow(String text1, String text2, String text3, {bool isColored = false}) {
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text3),
          ),
        ]);
  }
}
