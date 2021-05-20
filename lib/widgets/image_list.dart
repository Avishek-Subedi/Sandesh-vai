import 'package:flutter/material.dart';

import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  ImageList(this.images);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, int index) {
          return buildImage(images[index]);
        });
  }

  Widget buildImage(ImageModel image) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Image.network(image.url),
            ),
            Text(image.title),
          ],
        ));
  }
}
