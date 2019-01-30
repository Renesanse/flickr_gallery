import 'package:flickr_gallery/repository/repository.dart';
import 'dart:async';

class Bloc {
  final _repository = Repository();
  final _controllerImages = StreamController.broadcast();
  get images => _controllerImages.stream;

  fetchAllImages(page) async {
    _controllerImages.add(await _repository.getImages(page));
    var st = Stream.periodic(Duration(minutes: 5));
    st.listen((onData) async {
      _repository.list.clear();
      _controllerImages.add(await _repository.getImages(page));
    });
  }
}

final bloc = Bloc();