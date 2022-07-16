import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_and_book/model/newsmodel.dart';

class NewsApiService {
  final String postsURL =
      "https://newsapi.org/v2/everything?q=bitcoin&from=2022-06-15&sortBy=publishedAt&apiKey=c488ec705f3c43b6a4501a65d4550347";

  Future<List<Articles>> getNewsApiData() async {
    try {
      print("Api Called");
      http.Response res = await http.get(Uri.parse(postsURL));
      // print("Api Called in await");
      // print("response data: ${res.body}");
      // print("res.statusCode: ${res.statusCode}");

      if (res.statusCode == 200) {
        Newsmodel newsmodel = Newsmodel();
        print("200 in");

        newsmodel = Newsmodel.fromJson(json.decode(res.body));
        print(newsmodel.status);

        List<Articles> posts = newsmodel.articles ?? [];
        print(posts.length);
        for (Articles a in posts) {
          print(a.title);
        }
        return posts;
      } else {
        throw "Unable to retrieve posts.";
      }
      // return posts;
    } on Exception catch (e) {
      throw ('New Exception: ${e.toString()}');
    }
  }
}
