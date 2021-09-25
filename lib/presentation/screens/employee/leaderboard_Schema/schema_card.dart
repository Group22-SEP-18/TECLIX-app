import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';

class SchemaCard extends StatelessWidget {
  final Color primaryColor;
  final String title;
  final String image;
  final Widget text;

  const SchemaCard({
    this.primaryColor,
    this.title,
    this.image,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CommonPadding(
      child: Card(
        color: Colors.white.withOpacity(1.0),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                image,
                height: 150.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15.0),
                  child: text),
            ],
          ),
        ),
      ),
    );
  }
}
