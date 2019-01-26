import 'package:http/http.dart';
import 'dart:convert';

class FlickrAPIProvider {
  getLinks(page) async {
    if(page < 11){
      // page 2 => error wtf flickr
      var answer = await get("https://api.flickr.com/services/rest/?method=flickr.photos.getRecent"
          "&api_key=4ca04d7cfa1926024e943b67a480c866&"
          "per_page=100&"
          "page=1&"
          "format=json&"
          "nojsoncallback=1&"
          "auth_token=72157689123065353-5ac87be42e9cbaa2&"
          "api_sig=7195e33d6fe4630173fd96605ba112e8");
      var answerList = jsonDecode(answer.body)["photos"]["photo"];
      return answerList.map((map){
        return "https://farm${map["farm"]}.staticflickr.com/${map["server"]}/${map["id"]}_${map["secret"]}_h.jpg";
      }).toList();
    }
  }
}