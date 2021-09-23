import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_late_pay/customer_late_pay_provider.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_bloc.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_event.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_back_btn.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/searchbar_preview.dart';
import 'package:teclix/presentation/routing/routes.dart';
import 'package:teclix/presentation/screens/customer/customer_profile/widgets/search_field.dart';
import 'package:teclix/presentation/screens/customer/customer_profile/widgets/search_result_card.dart';

class CustomerLatePaymentSearchPage extends StatelessWidget {
  static const String id = '/customer-latepayment--search';

  @override
  Widget build(BuildContext context) {
    final serachCustomerBloc = BlocProvider.of<SearchCustomerBloc>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: Container(
            color: ColorPrimary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                CommonPadding(
                  child: HeaderBackButton(
                    whenTapped: () => Navigator.pop(context),
                  ),
                ),
                Spacer(),
                CommonPadding(
                  child: BlocBuilder<SearchCustomerBloc, SearchCustomerState>(
                    builder: (context, state) {
                      return SearchField(
                        hintText: 'Enter Store Name, Customer Name',
                        onSubmit: (String searchString) => {
                          serachCustomerBloc
                              .add(SubmitSearchEvent(value: searchString)),
                        },
                      );
                    },
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        body: BlocBuilder<SearchCustomerBloc, SearchCustomerState>(
          buildWhen: (prev, cur) =>
              prev.searchResult != cur.searchResult ||
              prev.loading != cur.loading,
          builder: (context, state) {
            return state.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : state.searchResult.length == 0
                    ? SearchbarPreview(
                        previewImage: 'static/images/late_payment_search.png',
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, top: 15.0),
                            child: Text(
                              'Search Results',
                              style: TextStyle(
                                  color: ColorHeadingFont,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                itemCount: state.searchResult.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SearchResultCard(
                                    directTo: () => {
                                      serachCustomerBloc.add(
                                          AddSelectedCustomer(
                                              selected:
                                                  state.searchResult[index])),
                                      Navigator.of(context).push(
                                        Routes.getMaterialPageRoute(
                                            CustomerLatePayProvider.id,
                                            context),
                                      ),
                                    },
                                    shopName:
                                        state.searchResult[index].shopName,
                                    ownerLastName:
                                        state.searchResult[index].ownerLastName,
                                    ownerFistName: state
                                        .searchResult[index].ownerFirstName,
                                    profilePicUrl: state.searchResult[index]
                                                .profilePicture ==
                                            null
                                        ? ''
                                        : state
                                            .searchResult[index].profilePicture,
                                  );
                                }),
                          ),
                        ],
                      );
          },
        ),
      ),
    );
  }
}
