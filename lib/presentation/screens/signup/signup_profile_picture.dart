import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teclix/logic/bloc/signup/signup_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_event.dart';
import 'package:teclix/logic/bloc/signup/signup_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_outline_button.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class SignupProfilePicture extends StatefulWidget {
  @override
  _SignupProfilePictureState createState() => _SignupProfilePictureState();
}

class _SignupProfilePictureState extends State<SignupProfilePicture> {
  File _image;

  @override
  Widget build(BuildContext context) {
    final signupBloc = BlocProvider.of<SignupBloc>(context);
    _cropImage(filePath) async {
      File croppedImage = await ImageCropper.cropImage(
          sourcePath: filePath,
          maxWidth: 1080,
          maxHeight: 1080,
          cropStyle: CropStyle.circle,
          androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop image',
            toolbarColor: ColorPrimary,
            toolbarWidgetColor: Colors.white,
            cropFrameColor: ColorPrimaryLight,
            activeControlsWidgetColor: ColorPrimary,
          ));
      if (croppedImage != null) {
        _image = croppedImage;
        setState(() {});
      }
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 65.0,
          ),
          MainHeading(
            text: 'Profile Picture',
            fontSize: 24.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          CommonPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 150.0,
                  backgroundImage: _image != null
                      ? Image.file(
                          _image,
                          fit: BoxFit.cover,
                        ).image
                      : ExactAssetImage(
                          'static/images/profile_picture_placeholder.png',
                        ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RoundedOutlineButton(
                        title: 'Gallery',
                        borderColor: ColorLightGreen,
                        fillColor: Colors.white,
                        titleColor: ColorPrimary,
                        onPressed: () async {
                          XFile pickedImage = await ImagePicker().pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 50,
                          );
                          _cropImage(pickedImage.path);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: RoundedOutlineButton(
                        title: 'Camera',
                        borderColor: ColorLightGreen,
                        fillColor: Colors.white,
                        titleColor: ColorPrimary,
                        onPressed: () async {
                          XFile pickedImage = await ImagePicker().pickImage(
                            source: ImageSource.camera,
                            imageQuality: 50,
                            preferredCameraDevice: CameraDevice.front,
                          );
                          _cropImage(pickedImage.path);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          BlocBuilder<SignupBloc, SignupState>(
            buildWhen: (previous, current) => previous.step != current.step,
            builder: (context, state) {
              return CommonPadding(
                child: RoundedButton(
                  title: 'Next',
                  titleColor: Colors.white,
                  colour: ColorPrimary,
                  onPressed: () => signupBloc.add(
                    NextStepEvent(currentStep: state.step),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
