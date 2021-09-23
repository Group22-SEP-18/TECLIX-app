import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:teclix/data/models/CustomerLocation.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_event.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_outline_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_text_field.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class CustomerRegisterAddress extends StatelessWidget {
  static final streetController = TextEditingController();
  static final cityController = TextEditingController();
  static final districtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CustomerLocation _currentLocation =
        CustomerLocation.latLng(latitude: 0.0, longitude: 0.0);
    List<Placemark> _curLocationDetails;

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
            text: 'Store Address',
            fontSize: 24.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          BlocBuilder<CustomerRegistrationBloc, CustomerRegistrationState>(
            buildWhen: (prev, cur) =>
                prev.fetchingLocation != cur.fetchingLocation,
            builder: (context, state) {
              return state.fetchingLocation
                  ? Center(
                      child: SpinKitDualRing(
                        color: ColorLightGreen,
                        size: 100.0,
                      ),
                    )
                  : CommonPadding(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BlocBuilder<CustomerRegistrationBloc,
                              CustomerRegistrationState>(
                            builder: (context, state) {
                              streetController.text = state.storeAddress.street;

                              return RoundedTextField(
                                controller: streetController,
                                hint: 'Street',
                              );
                            },
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          BlocBuilder<CustomerRegistrationBloc,
                              CustomerRegistrationState>(
                            builder: (context, state) {
                              cityController.text = state.storeAddress.city;

                              return RoundedTextField(
                                controller: cityController,
                                hint: 'City',
                              );
                            },
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          BlocBuilder<CustomerRegistrationBloc,
                              CustomerRegistrationState>(
                            builder: (context, state) {
                              districtController.text =
                                  state.storeAddress.district;
                              return RoundedTextField(
                                controller: districtController,
                                hint: 'district',
                              );
                            },
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                        ],
                      ),
                    );
            },
          ),
          Spacer(),
          CommonPadding(
            child: BlocBuilder<CustomerRegistrationBloc,
                CustomerRegistrationState>(
              buildWhen: (prev, cur) =>
                  prev.storeAddress.latitude != cur.storeAddress.latitude,
              builder: (context, state) {
                _currentLocation.latitude = state.storeAddress.latitude != null
                    ? state.storeAddress.latitude
                    : 0.0;
                _currentLocation.longitude =
                    state.storeAddress.longitude != null
                        ? state.storeAddress.longitude
                        : 0.0;

                return RoundedOutlineButton(
                    title: 'Use my current location',
                    borderColor: ColorPrimary,
                    fillColor: Colors.white,
                    titleColor: ColorPrimary,
                    onPressed: () async {
                      customerRegisterBloc
                          .add(ChangeFetchingLoadingEvent(isLoading: true));
                      _curLocationDetails = await _currentLocation
                          .getCurrentLocation(context: context)
                          .then(
                            (_) async => await placemarkFromCoordinates(
                              _currentLocation.latitude,
                              _currentLocation.longitude,
                            ),
                          );

                      customerRegisterBloc
                          .add(ChangeFetchingLoadingEvent(isLoading: false));

                      streetController.text = _curLocationDetails[0].street;
                      cityController.text = _curLocationDetails[0].locality;
                      districtController.text =
                          _curLocationDetails[0].subAdministrativeArea;
                    });
              },
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          BlocBuilder<CustomerRegistrationBloc, CustomerRegistrationState>(
            builder: (context, state) {
              return CommonPadding(
                child: RoundedButton(
                  title: 'Next',
                  titleColor: Colors.white,
                  colour: ColorPrimary,
                  onPressed: () => {
                    customerRegisterBloc.add(AddAddressEvent(
                      street: streetController.text,
                      city: cityController.text,
                      district: districtController.text,
                      lat: _currentLocation.latitude,
                      lang: _currentLocation.longitude,
                    )),
                    customerRegisterBloc.add(AddCustomerFinalAddressEvent(
                        finalAddress: CustomerLocation(
                      street: streetController.text,
                      city: cityController.text,
                      district: districtController.text,
                      latitude: _currentLocation.latitude,
                      longitude: _currentLocation.longitude,
                    ))),
                    print(_currentLocation.latitude),
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
