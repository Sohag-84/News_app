import 'dart:convert';

import 'package:flutter_news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future fetchNews() async {
    var uri = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=b7a147696a4a4aaabd7857b1e3650a67');
    http.Response response;
    response = await http.get(uri);
    var jsonData = json.decode(response.body);

    // if (response.statusCode == 200) {
    //   var jsonData = json.decode(response.body);
     
    //     var articleModel = ArticleModel(
    //         author: jsonData['author'],
    //         tittle: jsonData['title'],
    //         description: jsonData['description'],
    //         url: jsonData['url'],
    //         urlToImage: jsonData["urlToImage"],
    //         content: jsonData['content']);

    //         news.add(articleModel);
      
    // }

    if (response.statusCode==200) {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              tittle: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],);

          //now add data in the list
          news.add(articleModel);
        }
      });
    }
  }
}

//for category news
class CatergoryNews {
  List<ArticleModel> news = [];

  Future<void> fetchCategoryNews(String category) async {
    var uri = Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=b7a147696a4a4aaabd7857b1e3650a67');
    http.Response response;
    response = await http.get(uri);
    var jsonData = json.decode(response.body);

    if (response.statusCode==200) {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              tittle: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],);

          //now add data in the list
          news.add(articleModel);
        }
      });
    }
  }
}
