import 'package:flutter/material.dart';
import 'package:unsplash_list/models/photo_model.dart';
import 'package:unsplash_list/repositories/photo_repository.dart';
import 'package:unsplash_list/widgets/photos_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final Future<List<PhotoModel>> photos = PhotoRepository().getPhotos();
  // late final Future<List<PhotoModel>> photos;

  // @override
  // void initState() {
  //   super.initState();
  //   photos = PhotoRepository().getPhotos();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Photos'),
        ),
        body: FutureBuilder<List<PhotoModel>>(
          future: photos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PhotosListWIdget().buildPhotosList(snapshot);
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
