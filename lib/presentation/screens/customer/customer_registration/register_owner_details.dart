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
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class CustomerRegisterOwnerDetails extends StatelessWidget {
  static final firstNameController = TextEditingController();
  static final lastNameController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();

  static final RegExp nameReg = RegExp(
    r'[A-Z]',
    caseSensitive: false,
  );

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
        customerRegisterBloc.add(AddOwnerPictureEvent(
          profilePicture: _image,
        ));
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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BlocBuilder<CustomerRegistrationBloc,
                      CustomerRegistrationState>(
                    buildWhen: (prev, cur) =>
                        prev.customer.profilePicture !=
                        cur.customer.profilePicture,
                    builder: (context, state) {
                      return Stack(
                        children: [
                          Align(
                            child: CircleAvatar(
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 90.0,
                                backgroundImage:
                                    state.customer.profilePicture != null
                                        ? Image.file(
                                            state.customer.profilePicture,
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
                                XFile pickedImage =
                                    await ImagePicker().pickImage(
                                  source: ImageSource.camera,
                                  imageQuality: 50,
                                  preferredCameraDevice: CameraDevice.front,
                                );
                                if (pickedImage != null) {
                                  _cropImage(pickedImage.path);
                                }
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
                    key: Key('fn'),
                    builder: (context, state) {
                      firstNameController.text = state.customer.ownerFistName;

                      return RoundedTextField(
                        controller: firstNameController,
                        hint: 'Owner\'s First Name',
                        validation: (String fname) {
                          if (fname == '' || fname == null) {
                            return "First name can\'t be empty.";
                          }
                          if (!nameReg.hasMatch(fname)) {
                            return "Owner\'s first name should only contain letters";
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  BlocBuilder<CustomerRegistrationBloc,
                      CustomerRegistrationState>(
                    key: Key('ln'),
                    builder: (context, state) {
                      lastNameController.text = state.customer.ownerLastName;

                      return RoundedTextField(
                        controller: lastNameController,
                        hint: 'Owner\'s Last Name',
                        validation: (String lname) {
                          if (lname == '' || lname == null) {
                            return "Owner\'s Last name can\'t be empty.";
                          }
                          if (!nameReg.hasMatch(lname)) {
                            return "Owner\'s last name should only contain letters";
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  InfoText(
                    text:
                        'Customer Picture is not required, you can skip it if necessary.',
                  )
                ],
              ),
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
                    if (_formKey.currentState.validate())
                      {
                        customerRegisterBloc.add(AddOwnerNameEvent(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                        )),
                        customerRegisterBloc.add(
                          NextStepEvent(currentStep: state.step),
                        ),
                      }
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
