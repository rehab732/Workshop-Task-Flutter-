import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:workshop/news.dart';

class GetData {
  String url =
      'https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=8593b281ba054ae08c2ee222e39e669c&page=1';
  fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      List<Articles> myList = [];
      for (var item in result["articles"]) {
        myList.add(Articles.fromJson(item));
      }
      return myList;
    }
  }
}
