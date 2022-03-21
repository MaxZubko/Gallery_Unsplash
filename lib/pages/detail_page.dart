import 'package:flutter/material.dart';
import 'package:unsplash_list/models/photo_model.dart';

class DetailPage extends StatelessWidget {
  final PhotoModel photos;

  const DetailPage({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datail'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: buildImage(),
      ),
    );
  }

  buildImage() {
    return Align(
      alignment: Alignment.center,
      child: Image(
        height: double.maxFinite,
        width: double.maxFinite,
        fit: BoxFit.cover,
        image: NetworkImage(photos.urls.regular),
      ),
    );
  }
}
