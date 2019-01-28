import 'package:http/http.dart';
import 'dart:convert';

class FlickrAPIProvider {
  getLinks(page) async {
    var answer = await get("https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&"
        "api_key=9ad3a7101e55bd6bf3a5612629b9e2cc&"
        "per_page=100&"
        "page=$page&"
        "format=json&"
        "nojsoncallback=1");
    var answerList = jsonDecode(answer.body)["photos"]["photo"];
    return answerList.map((json){
      return "https://farm${json["farm"]}.staticflickr.com/${json["server"]}/${json["id"]}_${json["secret"]}_m.jpg";
    }).toList();
  }
}