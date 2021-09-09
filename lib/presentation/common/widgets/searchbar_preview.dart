import 'package:flutter/material.dart';

class SearchbarPreview extends StatelessWidget {
  final String previewImage;

  const SearchbarPreview({this.previewImage});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        previewImage,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
