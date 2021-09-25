import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_event.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/screens/customer/customer_profile/widgets/search_field.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/widgets/elevated_btn.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/widgets/item_card.dart';

class SoAddItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customerSoBloc = BlocProvider.of<CustomerSoBloc>(context);
    customerSoBloc.add(FetchVehicleItemsEvent());

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 250.0,
            color: ColorPrimary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonPadding(
                  child: SearchField(
                    hintText: 'Enter Item Name',
                    onSubmit: (_) {},
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'OR',
                        style: TextStyle(color: Colors.white),
                      ),
                      Flexible(
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                CommonPadding(
                  child: SoElevatedBtn(
                    btnWidth: 300.0,
                    btnColor: ColorPrimary,
                    btnText: 'Barcode Scanner',
                  ),
                )
              ],
            ),
          ),
          CommonPadding(
            child: BlocBuilder<CustomerSoBloc, CustomerSoState>(
              buildWhen: (prev, cur) =>
                  prev.fetchingVehicleProducts != cur.fetchingVehicleProducts,
              builder: (context, state) {
                return state.fetchingVehicleProducts
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          for (var i = 0; i < state.vehicleItems.length; i += 2)
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BlocBuilder<CustomerSoBloc,
                                        CustomerSoState>(
                                      buildWhen: (prev, cur) =>
                                          prev.itemCount != cur.itemCount,
                                      builder: (context, state) {
                                        return ItemCard(
                                          imageUrl: state
                                              .vehicleItems[i].productImage,
                                          itemName:
                                              state.vehicleItems[i].shortName,
                                          price: state.vehicleItems[i].price,
                                          addFunc: () => customerSoBloc.add(
                                            AddToCartEvent(
                                                product: state.vehicleItems[i]),
                                          ),
                                          removeFunc: () => customerSoBloc.add(
                                            RemoveFromCartEvent(
                                                product: state.vehicleItems[i]),
                                          ),
                                          selectedAmount: state.cart[
                                                  state.vehicleItems[i].id] ??
                                              0,
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    i + 1 < state.vehicleItems.length
                                        ? BlocBuilder<CustomerSoBloc,
                                            CustomerSoState>(
                                            buildWhen: (prev, cur) =>
                                                prev.itemCount != cur.itemCount,
                                            builder: (context, state) {
                                              return ItemCard(
                                                imageUrl: state
                                                    .vehicleItems[i + 1]
                                                    .productImage,
                                                itemName: state
                                                    .vehicleItems[i + 1]
                                                    .shortName,
                                                price: state
                                                    .vehicleItems[i + 1].price,
                                                addFunc: () =>
                                                    customerSoBloc.add(
                                                  AddToCartEvent(
                                                      product: state
                                                          .vehicleItems[i + 1]),
                                                ),
                                                removeFunc: () =>
                                                    customerSoBloc.add(
                                                  RemoveFromCartEvent(
                                                      product: state
                                                          .vehicleItems[i + 1]),
                                                ),
                                                selectedAmount: state.cart[state
                                                        .vehicleItems[i + 1]
                                                        .id] ??
                                                    0,
                                              );
                                            },
                                          )
                                        : Container(
                                            height: 0.0,
                                            width: 0.0,
                                          ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
