import 'package:http/http.dart';
import 'dart:convert';

class FlickrAPIProvider {
  getLinks(page) async {
    if(page < 11){
      var answer = await get("https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=da4b3ce91c584238e4a6847857f46979&per_page=100&page=1&format=json&nojsoncallback=1&auth_token=72157678080102668-8e25de25f7b494a1&api_sig=fd1dd5b764e023709e25430fbf4fca5f");
      var answerList = jsonDecode(answer.body)["photos"]["photo"];
      return answerList.map((map){
        return "https://farm${map["farm"]}.staticflickr.com/${map["server"]}/${map["id"]}_${map["secret"]}_h.jpg";
      }).toList();
    }
  }
}