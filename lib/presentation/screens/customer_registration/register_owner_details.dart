import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_event.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/constants/camera_cropper_settings.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_text_field.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class CustomerRegisterOwnerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    File _image;
    final customerRegisterBloc =
        BlocProvider.of<CustomerRegistrationBloc>(context);

    _cropImage(filePath) async {
      File croppedImage = await ImageCropper.cropImage(
        sourcePath: filePath,
        maxWidth: 1080,
        maxHeight: 1080,
        cropStyle: CropStyle.circle,
        androidUiSettings: cropperAndriodSettings,
      );
      if (croppedImage != null) {
        _image = croppedImage;
        //:TODO add the photo to bloc
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
            text: 'Owner Details',
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
                BlocBuilder<CustomerRegistrationBloc,
                    CustomerRegistrationState>(
                  //:TODO add a build when

                  builder: (context, state) {
                    return Stack(
                      children: [
                        Align(
                          child: CircleAvatar(
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 90.0,
                              backgroundImage: _image != null
                                  ? Image.file(
                                      _image,
                                      fit: BoxFit.cover,
                                    ).image
                                  : Image.asset(
                                      'static/images/profile_placeholder.png',
                                      fit: BoxFit.contain,
                                    ).image,
                            ),
                            radius: 91.0,
                          ),
                          alignment: Alignment.center,
                        ),
                        Positioned(
                          child: FloatingActionButton(
                            heroTag: 'open camera',
                            child: Icon(Icons.camera_alt),
                            mini: true,
                            onPressed: () async {
                              XFile pickedImage = await ImagePicker().pickImage(
                                source: ImageSource.camera,
                                imageQuality: 50,
                                preferredCameraDevice: CameraDevice.front,
                              );
                              _cropImage(pickedImage.path);
                            },
                          ),
                          right: 0.0,
                          bottom: 0.0,
                          left: 120.0,
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                BlocBuilder<CustomerRegistrationBloc,
                    CustomerRegistrationState>(
                  builder: (context, state) {
                    return RoundedTextField(
                      hint: 'Owner\'s First Name',
                    );
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                BlocBuilder<CustomerRegistrationBloc,
                    CustomerRegistrationState>(
                  builder: (context, state) {
                    return RoundedTextField(
                      hint: 'Owner\'s Last Name',
                    );
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
          Spacer(),
          BlocBuilder<CustomerRegistrationBloc, CustomerRegistrationState>(
            builder: (context, state) {
              return CommonPadding(
                child: RoundedButton(
                  title: 'Next',
                  titleColor: Colors.white,
                  colour: ColorPrimary,
                  onPressed: () => {
                    customerRegisterBloc.add(
                      NextStepEvent(currentStep: state.step),
                    ),
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
