import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/data/models/AssignedVehicle.dart';
import 'package:teclix/logic/bloc/salesperson_vehicle/salesperson_vehicle_bloc.dart';
import 'package:teclix/logic/bloc/salesperson_vehicle/salesperson_vehicle_event.dart';
import 'package:teclix/logic/bloc/salesperson_vehicle/salesperson_vehicle_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/screens/customer/widgets/customer_main_clip_path.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';
import 'package:teclix/presentation/screens/vehicle/widgets/item_detail_card.dart';
import 'package:teclix/presentation/screens/vehicle/widgets/product_info_card.dart';
import 'package:teclix/presentation/screens/vehicle/widgets/vehicle_stat_card.dart';
import 'package:intl/intl.dart';

class VehicleMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spVehicleBloc = BlocProvider.of<SalespersonVehicleBloc>(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: ClipPath(
            clipper: CustomerMainClipPath(),
            child: Container(
              color: ColorPrimary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => spVehicleBloc.add(FetchVehicleDataEvent()),
                    child: Center(
                      child: AppbarHeadingText(
                        title: 'Vehicle',
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: BlocBuilder<SalespersonVehicleBloc, SalespersonVehicleState>(
          buildWhen: (prev, cur) => prev.loadingData != cur.loadingData,
          builder: (context, state) {
            return state.loadingData
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: CommonPadding(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  'Assigned Vehicle',
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    color: ColorPrimary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () => spVehicleBloc
                                      .add(FetchVehicleDataEvent()),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Icon(
                                      Icons.refresh_rounded,
                                      color: ColorPrimary,
                                      size: 40.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          BlocBuilder<SalespersonVehicleBloc,
                              SalespersonVehicleState>(
                            buildWhen: (prev, cur) =>
                                prev.salespersonVehicle.vehicle !=
                                cur.salespersonVehicle.vehicle,
                            builder: (context, state) {
                              return VehicleStatCard(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10.0,
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                          ),
                                          child: state.salespersonVehicle
                                                      .vehicle.vehicleImage !=
                                                  null
                                              ? Container(
                                                  width: 100.0,
                                                  height: 170.0,
                                                  child: FittedBox(
                                                    fit: BoxFit.fill,
                                                    child: Image.network(
                                                      state.salespersonVehicle
                                                          .vehicle.vehicleImage,
                                                    ),
                                                  ),
                                                )
                                              : Image.asset(
                                                  'static/images/van.jpg',
                                                  height: 170.0,
                                                )),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          MainHeading(
                                            text: state.salespersonVehicle
                                                        .vehicle.vehicleType !=
                                                    null
                                                ? state.salespersonVehicle
                                                    .vehicle.vehicleNumber
                                                : 'loading',
                                            fontSize: 28.0,
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            children: [
                                              MainHeading(
                                                text: 'Model/Make:',
                                                fontSize: 20.0,
                                                color: ColorPrimary,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              SizedBox(
                                                width: 15.0,
                                              ),
                                              MainHeading(
                                                text: state
                                                            .salespersonVehicle
                                                            .vehicle
                                                            .vehicleType !=
                                                        null
                                                    ? state.salespersonVehicle
                                                        .vehicle.vehicleModel
                                                        .toUpperCase()
                                                    : 'loading',
                                              ),
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            children: [
                                              MainHeading(
                                                text: 'Type:',
                                                fontSize: 20.0,
                                                color: ColorPrimary,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              SizedBox(
                                                width: 15.0,
                                              ),
                                              MainHeading(
                                                text: state
                                                            .salespersonVehicle
                                                            .vehicle
                                                            .vehicleType !=
                                                        null
                                                    ? state.salespersonVehicle
                                                        .vehicle.vehicleType
                                                        .toLowerCase()
                                                    : 'loading',
                                              ),
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Remaining Stock Status',
                              style: TextStyle(
                                fontSize: 23.0,
                                color: ColorPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ItemDetailCard(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MainHeading(
                                      color: Colors.white,
                                      text: 'Products',
                                      fontSize: 20.0,
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    BlocBuilder<SalespersonVehicleBloc,
                                        SalespersonVehicleState>(
                                      builder: (context, state) {
                                        return MainHeading(
                                          color: Colors.white,
                                          text: state.salespersonVehicle
                                              .assignedVehicle.length
                                              .toString()
                                              .padLeft(2, '0'),
                                          fontSize: 45.0,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              ItemDetailCard(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MainHeading(
                                      color: Colors.white,
                                      text: 'Items',
                                      fontSize: 20.0,
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    BlocBuilder<SalespersonVehicleBloc,
                                        SalespersonVehicleState>(
                                      buildWhen: (prev, cur) =>
                                          prev.totalItems != cur.totalItems,
                                      builder: (context, state) {
                                        return MainHeading(
                                          color: Colors.white,
                                          text: state.totalItems
                                              .toString()
                                              .padLeft(2, '0'),
                                          fontSize: 45.0,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Products',
                              style: TextStyle(
                                fontSize: 23.0,
                                color: ColorPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          BlocBuilder<SalespersonVehicleBloc,
                              SalespersonVehicleState>(
                            builder: (context, state) {
                              List<AssignedVehicle> list =
                                  state.salespersonVehicle.assignedVehicle;

                              return Column(
                                children: [
                                  for (int i = 0; i < list.length; i++)
                                    ProductInfoCard(
                                      productImage:
                                          list[i].product.productImage,
                                      productName: list[i].product.longName,
                                      productPrice:
                                          NumberFormat.currency(name: 'Rs ')
                                              .format(list[i].product.price),
                                      productQuantity:
                                          list[i].quantity.toString(),
                                    ),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
