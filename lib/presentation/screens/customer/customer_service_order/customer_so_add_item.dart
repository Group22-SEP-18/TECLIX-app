import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/screens/customer/customer_profile/widgets/search_field.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/widgets/elevated_btn.dart';

class SoAddItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
