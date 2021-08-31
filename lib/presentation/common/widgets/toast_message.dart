import 'package:flutter/material.dart';

showToast({
  BuildContext context,
  String text,
  Color color,
  int durationInSec,
}) async {
  OverlayState overlayState = Overlay.of(context);
  OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: Material(
              color: Color(0x00000000),
              child: Container(
                height: 55.0,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0), color: color),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(
                          Icons.error_outline,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          text,
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));

  overlayState.insert(overlayEntry);

  await Future.delayed(Duration(seconds: durationInSec));

  overlayEntry.remove();
}
