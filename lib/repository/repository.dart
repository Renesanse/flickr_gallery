import 'package:flickr_gallery/provider/provider.dart';

class Repository {
  var list = [];
  final flickrAPIProvider = FlickrAPIProvider();

  getImages(page) async {
    list.addAll(await flickrAPIProvider.getLinks(page));
    print(list.length);
    return list;
  }

}


