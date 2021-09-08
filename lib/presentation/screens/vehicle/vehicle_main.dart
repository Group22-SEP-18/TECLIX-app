import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/screens/customer/widgets/customer_main_clip_path.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';
import 'package:teclix/presentation/screens/vehicle/widgets/item_detail_card.dart';
import 'package:teclix/presentation/screens/vehicle/widgets/vehicle_stat_card.dart';

class VehicleMain extends StatelessWidget {
  static const String id = '/vehicle-main';
  @override
  Widget build(BuildContext context) {
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
                  Center(
                    child: AppbarHeadingText(
                      title: 'Vehicle',
                      fontSize: 30.0,
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
        body: SingleChildScrollView(
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
                  child: Text(
                    'Assigned Vehicle',
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
                VehicleStatCard(
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
                          child: Image.asset(
                            'static/images/van.jpg',
                            height: 170.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            MainHeading(
                              text: 'WP KA 2020',
                              fontSize: 25.0,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            MainHeading(
                              text: 'Toyota',
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            MainHeading(
                              text: 'Hiace',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Stock Status',
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
                            text: 'Sold',
                            fontSize: 20.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          MainHeading(
                            color: Colors.white,
                            text: '25',
                            fontSize: 45.0,
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
                            text: 'Remaining',
                            fontSize: 20.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          MainHeading(
                            color: Colors.white,
                            text: '115',
                            fontSize: 45.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
