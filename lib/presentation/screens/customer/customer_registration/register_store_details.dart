import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_event.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_text_field.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class CustomerRegisterStoreDetails extends StatelessWidget {
  static final storeNameController = TextEditingController();
  static final emailController = TextEditingController();
  static final contactNoController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  static final RegExp emailRegex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    caseSensitive: false,
  );

  @override
  Widget build(BuildContext context) {
    final customerRegisterBloc =
        BlocProvider.of<CustomerRegistrationBloc>(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 65.0,
          ),
          MainHeading(
            text: 'Store Details',
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
                    key: Key('store'),
                    builder: (context, state) {
                      storeNameController.text = state.customer.shopName;
                      return RoundedTextField(
                        controller: storeNameController,
                        hint: 'Store Name',
                        validation: (String fname) {
                          if (fname == '' || fname == null) {
                            return "Store name can\'t be empty.";
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
                    key: Key('email'),
                    builder: (context, state) {
                      emailController.text = state.customer.email;
                      return RoundedTextField(
                        controller: emailController,
                        hint: 'Email',
                        validation: (String email) {
                          if (email == '' || email == null) {
                            return "Email Field can\'t be empty.";
                          }
                          if (!emailRegex.hasMatch(email)) {
                            return "Email address is invalid";
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
                    buildWhen: (prev, cur) =>
                        prev.customer.contactNo != cur.customer.contactNo,
                    key: Key('contact'),
                    builder: (context, state) {
                      contactNoController.text = state.customer.contactNo;
                      return RoundedTextField(
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        controller: contactNoController,
                        hint: 'Contact Number',
                        validation: (String number) {
                          if (number == '' || number == null) {
                            return "Contact number field can\'t be empty.";
                          }
                          if (number.length != 10) {
                            return "Contact number should contain 10 digits.";
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
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
                        customerRegisterBloc.add(AddStoreDetailsEvent(
                          storeName: storeNameController.text,
                          email: emailController.text,
                          contactNo: contactNoController.text,
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
