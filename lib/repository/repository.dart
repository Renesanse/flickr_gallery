import 'package:flickr_gallery/provider/provider.dart';

class Repository {
  final flickrAPIProvider = FlickrAPIProvider();

  getImages(page) async {
    return await flickrAPIProvider.getLinks(page);
  }

}


