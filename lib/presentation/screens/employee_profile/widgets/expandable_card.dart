import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class ExpandableCard extends StatelessWidget {
  final String collapsedInfo;
  final IconData collapsedIcon;
  final Widget expandedChild;

  const ExpandableCard({
    this.collapsedInfo,
    this.collapsedIcon,
    this.expandedChild,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expandable(
            collapsed: ExpandableButton(
              child: Card(
                margin: EdgeInsets.zero,
                shape: Border.symmetric(
                    horizontal:
                        BorderSide(color: Colors.grey.shade400, width: 0.4)),
                color: Colors.grey.shade200,
                borderOnForeground: true,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        collapsedIcon,
                        size: 28.0,
                        color: ColorPrimary,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        collapsedInfo,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: ColorPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        FontAwesomeIcons.chevronRight,
                        color: ColorPrimary,
                      )
                    ],
                  ),
                ),
              ),
            ),
            expanded: Column(children: [
              ExpandableButton(
                child: Card(
                  margin: EdgeInsets.only(bottom: 0.0),
                  shape: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey, width: 0.4)),
                  color: Colors.grey.shade200,
                  borderOnForeground: true,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              collapsedIcon,
                              size: 25.0,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              collapsedInfo,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              FontAwesomeIcons.chevronUp,
                              color: ColorPrimary,
                            )
                          ],
                        ),
                      ),
                      expandedChild,
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
