import 'package:http/http.dart';
import 'dart:convert';

class FlickrAPIProvider {
  getLinks(page) async {
    var answer = await get("https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&"
       "api_key=d31097b68d2630ef9b9cbd98bebc1ffd&"
       "per_page=100&"
       "page=$page&"
        "format=json&nojsoncallback=1");
    var answerList = jsonDecode(answer.body)["photos"]["photo"];
    return answerList.map((json){
      return "https://farm${json["farm"]}.staticflickr.com/${json["server"]}/${json["id"]}_${json["secret"]}_h.jpg";
    }).toList();
  }
}