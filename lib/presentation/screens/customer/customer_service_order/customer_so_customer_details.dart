import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_event.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_state.dart';
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
          CustomerDetailsCard(
            profilePic: 'static/images/profile_dummy.jpg',
            shop: 'Gamini Stores (Pvt) Ltd',
            owner: 'Owner Name',
            street: '4A , hilda lane',
            city: 'Dehiwala',
            district: 'Colombo',
            borderTop: 0.0,
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
