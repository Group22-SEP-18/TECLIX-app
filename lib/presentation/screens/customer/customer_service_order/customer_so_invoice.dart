import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/data/models/AssignedVehicle.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_event.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/constants/utils.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_outline_button.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/widgets/invoice_card.dart';

class CustomerSoInvoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customerSoBloc = BlocProvider.of<CustomerSoBloc>(context);
    double totalAmount = 0.0;

    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 20.0,
        ),
        CommonPadding(
          child: Text(
            'Invoice',
            style: TextStyle(
              color: ColorPrimary,
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Divider(
          height: 5.0,
          color: ColorPrimary,
        ),
        SizedBox(
          height: 25.0,
        ),
        BlocBuilder<CustomerSoBloc, CustomerSoState>(
          buildWhen: (prev, cur) => prev.cart != cur.cart,
          builder: (context, state) {
            return CommonPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: state.cart.entries.map((entry) {
                  AssignedVehicle p = AssignedVehicle.getByProductId(
                      entry.key, state.vehicleItems);
                  totalAmount +=
                      entry.value.toInt() * p.product.price.toDouble();
                  customerSoBloc.add(SetTotalAmount(amount: totalAmount));

                  return Visibility(
                    visible: entry.value != 0,
                    child: InvoiceCard(
                      quntity: entry.value,
                      itemName: p.product.longName,
                      price: p.product.price,
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
        SizedBox(
          height: 20.0,
        ),
        CommonPadding(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  color: ColorHeadingFont,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              BlocBuilder<CustomerSoBloc, CustomerSoState>(
                buildWhen: (prev, cur) => prev.totalAmount != cur.totalAmount,
                builder: (context, state) {
                  return Text(
                    Utils.returnCurrency(state.totalAmount, 'Rs '),
                    style: TextStyle(
                      color: ColorHeadingFont,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Spacer(),
        BlocBuilder<CustomerSoBloc, CustomerSoState>(
          builder: (context, state) {
            return CommonPadding(
              child: RoundedButton(
                padding: 8.0,
                title: 'Pay Now',
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
        SizedBox(
          height: 10.0,
        ),
        CommonPadding(
          child: RoundedOutlineButton(
            title: 'Pay Later',
            borderColor: ColorLightGreen,
            fillColor: Colors.white,
            titleColor: ColorPrimary,
            //:TODO go to the main page fix
            onPressed: () => Navigator.pop(context),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    ));
  }
}
