import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/data/models/AssignedVehicle.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_event.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/toast_message.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/widgets/elevated_btn.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/widgets/item_card.dart';

class SoAddItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customerSoBloc = BlocProvider.of<CustomerSoBloc>(context);
    customerSoBloc.add(FetchVehicleItemsEvent());
    String barcode;

    Future<String> scanBarcodeNormal() async {
      String barcodeId;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        barcodeId = await FlutterBarcodeScanner.scanBarcode(
            '#00ab55', 'Go Back', false, ScanMode.BARCODE);
        // customerSoBloc.add(SetBarcodeValueEvent(value: barcodeId));
      } on PlatformException {
        barcodeId = 'Failed to get platform version.';
      }
      return barcodeId;
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100.0,
            color: ColorPrimary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.0,
                ),
                BlocBuilder<CustomerSoBloc, CustomerSoState>(
                  builder: (context, state) {
                    return Builder(builder: (context) {
                      return CommonPadding(
                        child: SoElevatedBtn(
                          btnWidth: 300.0,
                          btnColor: ColorPrimary,
                          btnText: 'Barcode Scanner',
                          onPressed: () async {
                            customerSoBloc.add(ChangeFetchingVehicleItemEvent(
                                isLoading: true));
                            barcode = await scanBarcodeNormal();

                            AssignedVehicle product =
                                AssignedVehicle.getByBarcode(
                                    barcode, state.vehicleItems);
                            if (product == null) {
                              customerSoBloc.add(ChangeFetchingVehicleItemEvent(
                                  isLoading: false));
                              showToast(
                                isError: true,
                                iconSize: 40,
                                height: 60.0,
                                color: ColorToastRed,
                                text: 'Scanned Item is not valid',
                                context: context,
                                durationInSec: 3,
                              );
                            } else {
                              customerSoBloc
                                  .add(AddSelectedItem(product: product));
                              customerSoBloc.add(ChangeFetchingVehicleItemEvent(
                                  isLoading: false));
                            }
                          },
                        ),
                      );
                    });
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          ),
          BlocBuilder<CustomerSoBloc, CustomerSoState>(
            buildWhen: (prev, cur) =>
                prev.fetchingVehicleProducts != cur.fetchingVehicleProducts,
            builder: (context, state) {
              return state.fetchingVehicleProducts
                  ? Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        BlocBuilder<CustomerSoBloc, CustomerSoState>(
                          buildWhen: (prev, cur) =>
                              prev.itemCount != cur.itemCount ||
                              prev.scannedProduct != cur.scannedProduct,
                          builder: (context, state) {
                            print(state.scannedProduct);
                            return state.scannedProduct.product != null
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonPadding(
                                        child: Row(
                                          children: [
                                            Text(
                                              'Search Result',
                                              style: TextStyle(
                                                  fontSize: 21.0,
                                                  color: ColorPrimary,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () => customerSoBloc.add(
                                                AddSelectedItem(
                                                    product: AssignedVehicle()),
                                              ),
                                              child: Icon(
                                                Icons.cancel,
                                                color: ColorDarkGreen,
                                                size: 30.0,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        height: 0.0,
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      CommonPadding(
                                        child: ItemCard(
                                          imageUrl: state.scannedProduct.product
                                              .productImage,
                                          itemName: state
                                              .scannedProduct.product.shortName,
                                          price: state
                                              .scannedProduct.product.price,
                                          addFunc: () => customerSoBloc.add(
                                            AddToCartEvent(
                                                product: state
                                                    .scannedProduct.product),
                                          ),
                                          removeFunc: () => customerSoBloc.add(
                                            RemoveFromCartEvent(
                                                product: state
                                                    .scannedProduct.product),
                                          ),
                                          selectedAmount: state.cart[state
                                                  .scannedProduct.product.id] ??
                                              0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Divider(
                                        height: 0.0,
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0.0,
                                  );
                          },
                        ),
                        for (var i = 0; i < state.vehicleItems.length; i += 2)
                          CommonPadding(
                            child: Column(
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
                                          imageUrl: state.vehicleItems[i]
                                              .product.productImage,
                                          itemName: state.vehicleItems[i]
                                              .product.shortName,
                                          price: state
                                              .vehicleItems[i].product.price,
                                          addFunc: () => customerSoBloc.add(
                                            AddToCartEvent(
                                                product: state
                                                    .vehicleItems[i].product),
                                          ),
                                          removeFunc: () => customerSoBloc.add(
                                            RemoveFromCartEvent(
                                                product: state
                                                    .vehicleItems[i].product),
                                          ),
                                          selectedAmount: state.cart[state
                                                  .vehicleItems[i]
                                                  .product
                                                  .id] ??
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
                                                    .product
                                                    .productImage,
                                                itemName: state
                                                    .vehicleItems[i + 1]
                                                    .product
                                                    .shortName,
                                                price: state.vehicleItems[i + 1]
                                                    .product.price,
                                                addFunc: () =>
                                                    customerSoBloc.add(
                                                  AddToCartEvent(
                                                      product: state
                                                          .vehicleItems[i + 1]
                                                          .product),
                                                ),
                                                removeFunc: () =>
                                                    customerSoBloc.add(
                                                  RemoveFromCartEvent(
                                                      product: state
                                                          .vehicleItems[i + 1]
                                                          .product),
                                                ),
                                                selectedAmount: state.cart[state
                                                        .vehicleItems[i + 1]
                                                        .product
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
                          ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    );
            },
          )
        ],
      ),
    );
  }
}
