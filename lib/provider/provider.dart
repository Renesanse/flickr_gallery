import 'package:http/http.dart';
import 'dart:convert';

class FlickrAPIProvider {
  getLinks(page) async {
    var answer = await get("https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=b70cc739c3f5aa69c88286cd25f27977&per_page=100&page=1&format=json&nojsoncallback=1");
    var answerList = jsonDecode(answer.body)["photos"]["photo"];
    return answerList.map((json){
      return "https://farm${json["farm"]}.staticflickr.com/${json["server"]}/${json["id"]}_${json["secret"]}_m.jpg";
    }).toList();
  }
}