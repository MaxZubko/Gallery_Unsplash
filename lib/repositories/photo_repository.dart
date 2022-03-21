import 'package:unsplash_list/models/photo_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhotoRepository {
  Future<List<PhotoModel>> getPhotos() async {
    String photoUrl =
        'https://api.unsplash.com/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';

    List<PhotoModel> list = [];
    final response = await http.get(Uri.parse(photoUrl));

    if (response.statusCode == 200) {
      List jsonDecode = json.decode(response.body);
      for (int i = 0; i < jsonDecode.length; i++) {
        list.add(PhotoModel.fromJson(jsonDecode[i]));
      }
      return list;
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
