import 'package:http/http.dart';
import 'dart:convert';

class FlickrAPIProvider {
  getLinks(page) async {
    var answer = await get("https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&"
        "api_key=76a404d8ea0a32808195795c325365b8&"
        "page=2&"
        "format=json&"
        "nojsoncallback=1");
    var answerList = jsonDecode(answer.body)["photos"]["photo"];
    return answerList.map((json){
      return "https://farm${json["farm"]}.staticflickr.com/${json["server"]}/${json["id"]}_${json["secret"]}_h.jpg";
    }).toList();
  }
}