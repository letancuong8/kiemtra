import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for using json.decode()

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Tancuong',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The list that contains information about photos
  List _business = [];
  List _popularity = [];
  List _publishedAt = [];

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    const API_URL =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f4f6839fc8024bf8a534fffc141291b1';

    final response = await http.get(Uri.parse(API_URL));
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["articles"];
    setState(() {
      _business = data;
    });
  }

  Future<void> _fetchData1() async {
    const API_URL =
        'https://newsapi.org/v2/everything?q=apple&from=2021-11-15&to=2021-11-15&sortBy=popularity&apiKey=f4f6839fc8024bf8a534fffc141291b1';

    final response = await http.get(Uri.parse(API_URL));
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["articles"];
    setState(() {
      _popularity = data;
    });
  }

  Future<void> _fetchData2() async {
    const API_URL =
        'https://newsapi.org/v2/everything?q=tesla&from=2021-10-16&sortBy=publishedAt&apiKey=f4f6839fc8024bf8a534fffc141291b1';

    final response = await http.get(Uri.parse(API_URL));
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["articles"];
    setState(() {
      _publishedAt = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RATE MY NEWS'),
        ),
        body: Container(
          height: 10000.0,
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 10000.0,
                    child: Center(
                        child: Carousel(
                      images: [
                        //slide 1
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {}, // handle your image tap here
                              child: Image.asset(
                                'img/img1.jpg',
                                fit: BoxFit
                                    .cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0,
                              ),
                            ),
                            ElevatedButton(
                              child: Text('SHOW'),
                              onPressed: _fetchData,
                            ),
                            SingleChildScrollView(
                              child: Container(
                                  height: 1000.0,
                                  child: ListView.builder(
                                    itemCount: _business.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return ListTile(
                                        leading: Image.network(
                                          _business[index]["urlToImage"],
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(_business[index]['title']),
                                        subtitle: Text(
                                            'NEWS ID: ${_business[index]["id"]}'),
                                      );
                                    },
                                  )),
                            ),
                          ],
                        ),

                        //slide 2
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {}, // handle your image tap here
                              child: Image.asset(
                                'img/img2.jpg',
                                fit: BoxFit
                                    .cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0,
                              ),
                            ),
                            ElevatedButton(
                              child: Text('SHOW'),
                              onPressed: _fetchData1,
                            ),
                            SingleChildScrollView(
                              child: Container(
                                  height: 1000.0,
                                  child: ListView.builder(
                                    itemCount: _popularity.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return ListTile(
                                        leading: Image.network(
                                          _popularity[index]["urlToImage"],
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        title:
                                            Text(_popularity[index]['title']),
                                        subtitle: Text(
                                            'NEWS ID: ${_popularity[index]["id"]}'),
                                      );
                                    },
                                  )),
                            ),
                          ],
                        ),

                        //slide 3
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {}, // handle your image tap here
                              child: Image.asset(
                                'img/img3.jpg',
                                fit: BoxFit
                                    .cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0,
                              ),
                            ),
                            ElevatedButton(
                              child: Text('SHOW'),
                              onPressed: _fetchData2,
                            ),
                            SingleChildScrollView(
                              child: Container(
                                  height: 1000.0,
                                  child: ListView.builder(
                                    itemCount: _publishedAt.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return ListTile(
                                        leading: Image.network(
                                          _publishedAt[index]["urlToImage"],
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        title:
                                            Text(_publishedAt[index]['title']),
                                        subtitle: Text(
                                            'NEWS ID: ${_publishedAt[index]["id"]}'),
                                      );
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ],
                      autoplay: false,
                    ))),
              ],
            ),
          )),
        ));

    // The ListView that displays photos
  }
}
