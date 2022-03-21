import 'package:flutter/material.dart';
import 'package:unsplash_list/models/photo_model.dart';
import 'package:unsplash_list/pages/detail_page.dart';

class PhotosListWIdget {
  Widget buildPhotosList(AsyncSnapshot<List<PhotoModel>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: SizedBox(
            height: 50.0,
            width: 50.0,
            child: Image.network(
              snapshot.data![index].urls.small,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(snapshot.data![index].user.userName),
          subtitle: Text(snapshot.data![index].description),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) =>
                      DetailPage(photos: snapshot.data![index])))),
        );
      },
    );
  }
}
