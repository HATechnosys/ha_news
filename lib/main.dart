import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ha_news/NewsDetailPage.dart';
import 'package:http/http.dart' as http;

import 'models/NewsModel.dart';

void main() {
  runApp(News());
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News app",
      home: Scaffold(
        appBar: AppBar(title: Text("News")),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Articles> newsList = List();

  @override
  void initState() {
    super.initState();
    fetchNews().then((news) {
      setState(() {
        newsList.addAll(news.articles);
      });
    });
    int n = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            Articles news = newsList[index];
            return ListTile(
              leading: Hero(
                  tag: news.urlToImage,
                  child: Image.network(
                    news.urlToImage,
                    width: MediaQuery.of(context).size.width * 0.25,
                    fit: BoxFit.fitWidth,
                  )),
              title: Text(news.title),
              subtitle: Text(
                news.description,
                maxLines: 3,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsDetailPage(news)));
              },
            );
          },
        ));
  }

  Future<NewsModel> fetchNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=apple&from=2021-03-02&sortBy=popularity&apiKey=a90e036613dd4ad6aa050991ebcbe52e";
    final response = await http.get('$url');
    print(response.statusCode);
    if (response.statusCode == 200) {
      final parse = jsonDecode(response.body);
      print(parse);
      return NewsModel.fromJson(parse);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
