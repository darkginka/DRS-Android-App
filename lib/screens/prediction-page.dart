import 'dart:convert';
import 'package:diet_recommanded_system/Utils/Utils.dart';
import 'package:diet_recommanded_system/Utils/Widget-utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pie_chart/pie_chart.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({Key? key}) : super(key: key);

  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false, isPredictionComplete = false;
  List<dynamic> diseaseList = [];
  String diseasevalue = '';
  List precaution = [];
  List prediction = [];
  Map<String, dynamic> pie_value = {};
  Map<String, double> data_value = {};
  @override
  void initState() {
    loadDiseaseList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: WidgetUtils.buildAppBar(context, "Food Prediction"),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                WidgetUtils.searchAbleDropDown(
                  diseaseList,
                  diseasevalue,
                  "Disease Name",
                  diseasevalue,
                  const Icon(Icons.accessible),
                  (value) {
                    setState(() {
                      if (value == null) {
                        diseasevalue = '';
                      } else {
                        diseasevalue = value.toString();
                      }
                    });
                  },
                  "Select disease",
                  Colors.blue,
                  "disease",
                  (value) {
                    if (value == null || value.toString().isEmpty) {
                      return "Required";
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : WidgetUtils.buildRoundBtn('Get Food', () {
                          if (_formKey.currentState!.validate()) {
                            loadFoodList();
                          }
                        }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                    visible: isPredictionComplete,
                    child: Column(
                      children: [
                        const Divider(
                          indent: 10,
                          endIndent: 10,
                          thickness: 5.0,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        PieChart(
                          dataMap: data_value,
                          animationDuration: Duration(milliseconds: 800),
                          chartLegendSpacing: 32,
                          chartRadius: MediaQuery.of(context).size.width / 3.5,
                          initialAngleInDegree: 0,
                          chartType: ChartType.ring,
                          ringStrokeWidth: 32,
                          centerText: "Food",
                          legendOptions: const LegendOptions(
                            showLegendsInRow: false,
                            legendPosition: LegendPosition.right,
                            showLegends: true,
                            legendTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValueBackground: true,
                            showChartValues: true,
                            showChartValuesInPercentage: false,
                            showChartValuesOutside: false,
                            decimalPlaces: 1,
                          ),
                          // gradientList: ---To add gradient colors---
                          // emptyColorGradient: ---Empty Color gradient---
                        ),
                        const Text(
                          "Precautions",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: precaution.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Card(
                                    color: const Color.fromARGB(
                                        255, 180, 213, 230),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Center(
                                          child: Text(
                                        precaution[index].toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.0),
                                      )),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const Text(
                          "Food",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: prediction.length,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Card(
                                color: const Color.fromARGB(255, 180, 213, 230),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Center(
                                    child: Text(
                                      prediction[index],
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loadDiseaseList() {
    var requestFor = 'http://44.203.171.156:5000/disease';
    Future<Response> loadResponse = Utils.httpGet(requestFor, context);
    loadResponse.then((value) {
      if (value.statusCode == 200) {
        if (mounted) {
          setState(() {
            Map abc = json.decode(value.body);
            diseaseList = abc['diseases'];
          });
        }
      } else {
        WidgetUtils.showToast(jsonDecode(value.body), context);
      }
    });
  }

  void loadFoodList() {
    setState(() {
      precaution.clear();
      prediction.clear();
      isLoading = true;
    });
    var requestFor = 'http://44.203.171.156:5000/food';
    String param = diseasevalue.toString();
    Future<Response> foodResponse = Utils.httpPost(requestFor, param, context);
    WidgetUtils.showToast("WAIT FOR FEW SECONDS", context);
    foodResponse.then((value) {
      if (value.statusCode == 200) {
        if (mounted) {
          Map foodDetails = jsonDecode(value.body);
          setState(() {
            precaution = foodDetails["precaution"]["disease_precautions"];
            prediction = foodDetails["prediction"]["food_list"];
            pie_value = foodDetails["prediction"]["pie_value"];
            pie_value.forEach((key, value) {
              data_value.addAll({key: value.toDouble()});
            });
            isPredictionComplete = true;
          });
        }
      } else {
        WidgetUtils.showToast("BAD REQUEST", context);
      }
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }
}
