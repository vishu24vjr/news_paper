import 'package:http/http.dart' as http;
import 'package:news_app/models/article.dart';
import 'dart:convert';

import 'package:news_app/secret.dart';

class News {

  List<Article> news  = [];

  Future<void> getNews() async{

    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=${apiKey}";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: (element['author']!=null)? element['author']:"Unknown Source",///TODO
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: (element['content']!=null)? element["content"] : '',///TODO
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }

  }

  Future<void> getNewsWithKeyword(String keyword) async{

     String url = "https://newsapi.org/v2/everything?q=${keyword}&apiKey=${apiKey}";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: (element['author']!=null)? element['author']:"Unknown Source",///TODO
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: (element['content']!=null)? element["content"] : '',///TODO
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }


  }

}


class NewsForCategorie {

  List<Article> news  = [];

  Future<void> getNewsForCategory(String category) async{

    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${apiKey}";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: (element['author']!=null)? element['author']:"Unknown Source",///TODO
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: (element['content']!=null)? element["content"] : '',///TODO
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }


  }


}


