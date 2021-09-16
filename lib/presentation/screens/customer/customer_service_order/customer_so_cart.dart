import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/data/models/Product.dart';
import 'package:teclix/data/temporary/data.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/widgets/order_list_card.dart';

class CustomerSoCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            color: ColorPrimary,
            height: 100.0,
            width: double.infinity,
            child: CommonPadding(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Current Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          CommonPadding(
            child: BlocBuilder<CustomerSoBloc, CustomerSoState>(
              builder: (context, state) {
                return Column(
                  children: state.cart.entries.map((entry) {
                    Product p = Product.getByProductId(entry.key, vehicleProd);
                    return Visibility(
                      visible: entry.value != 0,
                      child: OrderListCard(
                        quntity: entry.value,
                        itemName: p.productName,
                        price: p.price,
                        image: p.productImageUrl,
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
