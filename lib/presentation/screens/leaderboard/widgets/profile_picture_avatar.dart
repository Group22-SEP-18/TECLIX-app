import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class ProfilePicAvatar extends StatelessWidget {
  final double circleRadius;
  final String picture;
  final double blurRad;
  final double spreadRad;

  const ProfilePicAvatar(
      {this.circleRadius, this.picture, this.blurRad, this.spreadRad});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: blurRad,
            color: ColorDarkGreen,
            spreadRadius: spreadRad,
          )
        ],
      ),
      child: CircleAvatar(
        radius: circleRadius + 2,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: circleRadius,
          backgroundImage: Image.network(
            picture,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: SizedBox(
                  height: 25.0,
                  width: 25.0,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                ),
              );
            },
          ).image,
        ),
      ),
    );
  }
}
