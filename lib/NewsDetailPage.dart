import 'package:flutter/material.dart';
import 'package:ha_news/NewsWebView.dart';
import 'package:ha_news/models/NewsModel.dart';

class NewsDetailPage extends StatelessWidget {
  Articles _articles;

  NewsDetailPage(this._articles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Details"),
      ),
      body: DetailsPage(_articles),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.open_in_browser),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsWebView(_articles.url)));
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  Articles _articles;

  DetailsPage(this._articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: _articles.urlToImage,
                child: Image.network(
                  _articles.urlToImage,
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _articles.title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _articles.description,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
