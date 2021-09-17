import 'package:flutter/material.dart';

class SearchbarPreview extends StatelessWidget {
  final String previewImage;
  final double size;

  const SearchbarPreview({this.previewImage, this.size});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        previewImage,
        fit: BoxFit.fitHeight,
        height: size,
      ),
    );
  }
}
