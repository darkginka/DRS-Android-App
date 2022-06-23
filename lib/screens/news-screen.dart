import 'dart:convert';

import 'package:diet_recommanded_system/Utils/Widget-utils.dart';
import 'package:diet_recommanded_system/screens/view-news.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List newsList = [],
      dropDownItem = [
        'Canada',
        'Australia',
        'India',
        'Ireland',
        'Malaysia',
        'New Zealand',
        'Nigeria',
        'Philippines',
        'Saudi Arabia',
        'Singapore',
        'South Africa',
        'United Kingdom',
        'United States'
      ];
  bool isLoading = true;
  String dropDownValue = 'India', countryCode = '';

  @override
  void initState() {
    super.initState();
    fetchNews('in');
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar:
              WidgetUtils.buildAppBar(context, "$dropDownValue Health News"),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: WidgetUtils.dropDownButton("Change Country",
                      'Change Country', dropDownValue, dropDownItem, (v) {
                setState(() {
                  dropDownValue = v;
                });
                selectCountry(v);
              })),
              isLoading
                  ? const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()))
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          double width = MediaQuery.of(context).size.width;
                          return GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ViewNews(
                                          url: newsList[index]['url'],
                                          title: newsList[index]['source']
                                                  ['name'] ??
                                              '',
                                        ))),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: const EdgeInsets.all(10),
                              child: SizedBox(
                                height: 390,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child:
                                          newsList[index]['urlToImage'] != null
                                              ? Image.network(
                                                  newsList[index]['urlToImage'],
                                                  height: 230,
                                                  width: width,
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.asset(
                                                  'assets/images/noImage.png',
                                                  height: 250,
                                                  width: width,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                    ),
                                    const SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          newsList[index]['title'] ?? '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          newsList[index]['description']
                                              .toString(),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 0, 8),
                                          child: SizedBox(
                                            width: width * .5,
                                            child: Text(
                                              newsList[index]['source']
                                                      ['name'] ??
                                                  '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 20, 8),
                                          child: Text(
                                            "Date: " +
                                                newsList[index]['publishedAt']
                                                    .toString()
                                                    .substring(0, 10) +
                                                " " +
                                                newsList[index]['publishedAt']
                                                    .toString()
                                                    .substring(11, 16),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: newsList.length, // 1000 list items
                      ),
                    ),
            ],
          )),
    );
  }

  selectCountry(v) {
    if (v == 'Canada') {
      fetchNews('ca');
    } else if (v == 'Australia') {
      fetchNews('au');
    } else if (v == 'India') {
      fetchNews('in');
    } else if (v == 'Ireland') {
      fetchNews('ie');
    } else if (v == 'Malaysia') {
      fetchNews('my');
    } else if (v == 'New Zealand') {
      fetchNews('nz');
    } else if (v == 'Nigeria') {
      fetchNews('ng');
    } else if (v == 'Philippines') {
      fetchNews('ph');
    } else if (v == 'Saudi Arabia') {
      fetchNews('sa');
    } else if (v == 'Singapore') {
      fetchNews('sg');
    } else if (v == 'South Africa') {
      fetchNews('za');
    } else if (v == 'United Kingdom') {
      fetchNews('gb');
    } else if (v == 'United States') {
      fetchNews('us');
    }
  }

  void fetchNews(code) async {
    setState(() {
      isLoading = true;
    });
    String url = 'https://newsapi.org/v2/top-headlines?country=' +
        code +
        '&category=health&apiKey=007c5560f88d4d8b83e2146e62e57c36';
    Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      newsList.clear();
      setState(() {
        newsList = jsonDecode(response.body)['articles'];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      WidgetUtils.showToast(
          "Something went wrong, Please try later...", context);
    }
  }
}
