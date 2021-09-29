import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/data/models/AssignedVehicle.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_event.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_state.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_bloc.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/screens/customer/widgets/customer_details_card.dart';

class SOCustomerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customerSoBloc = BlocProvider.of<CustomerSoBloc>(context);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<SearchCustomerBloc, SearchCustomerState>(
            builder: (context, state) {
              customerSoBloc.add(SetCustomerId(id: state.selectedCus.id));
              customerSoBloc.add(SetLoyaltyPointsEvent(
                  amount: double.parse(state.selectedCus.loyaltyPoints)));

              return CustomerDetailsCard(
                profilePic: state.selectedCus.profilePicture,
                shop: state.selectedCus.shopName,
                owner: state.selectedCus.ownerFirstName +
                    ' ' +
                    state.selectedCus.ownerLastName,
                street: state.selectedCus.street,
                city: state.selectedCus.city,
                district: state.selectedCus.district,
                borderTop: 0.0,
              );
            },
          ),
          Spacer(),
          Container(
            height: 330.0,
            child: Image.asset('static/images/so_preview.png'),
          ),
          SizedBox(
            height: 20.0,
          ),
          BlocBuilder<CustomerSoBloc, CustomerSoState>(
            builder: (context, state) {
              return CommonPadding(
                child: RoundedButton(
                  title: 'Create Service Order',
                  titleColor: Colors.white,
                  colour: ColorPrimary,
                  onPressed: () => {
                    customerSoBloc.add(
                      AddSelectedItem(product: AssignedVehicle()),
                    ),
                    customerSoBloc.add(
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
