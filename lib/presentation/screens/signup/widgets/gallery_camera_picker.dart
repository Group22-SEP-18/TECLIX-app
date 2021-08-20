// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:teclix/presentation/screens/signup/signup_profile_picture.dart';
//
// class GalleryCameraImagePicker extends StatefulWidget {
//   final type;
//
//   GalleryCameraImagePicker({this.type});
//
//   @override
//   _GalleryCameraImagePickerState createState() =>
//       _GalleryCameraImagePickerState(this.type);
// }
//
// class _GalleryCameraImagePickerState extends State<GalleryCameraImagePicker> {
//   File _image;
//   var imagePicker;
//   var type;
//
//   _GalleryCameraImagePickerState(this.type);
//   @override
//   void initState() {
//     super.initState();
//     imagePicker = new ImagePicker();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(type == ImageSourceType.camera
//               ? "Image from Camera"
//               : "Image from Gallery")),
//       body: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 52,
//           ),
//           Center(
//             child: GestureDetector(
//               onTap: () async {
//                 var source = type == ImageSourceType.camera
//                     ? ImageSource.camera
//                     : ImageSource.gallery;
//                 XFile image = await imagePicker.pickImage(
//                     source: source,
//                     imageQuality: 50,
//                     preferredCameraDevice: CameraDevice.front);
//                 setState(() {
//                   if (image != null) {
//                     _image = File(image.path);
//                   }
//                 });
//               },
//               child: CircleAvatar(
//                 // width: 200,
//                 // height: 200,
//                 radius: 100.0,
//                 backgroundImage: _image != null
//                     ? Image.file(
//                         _image,
//                       ).image
//                     : Container(
//                         decoration: BoxDecoration(color: Colors.red[200]),
//                         // width: 200,
//                         height: 400,
//                         child: Icon(
//                           Icons.camera_alt,
//                           color: Colors.grey[800],
//                         ),
//                       ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
