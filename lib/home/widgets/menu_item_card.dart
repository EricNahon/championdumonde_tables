import 'package:flutter/material.dart';

import 'package:get_it_mixin/get_it_mixin.dart';

import '../../core/constants.dart';
import '../../app/app_controller.dart';
import '../../core/locator.dart';
import '../../core/dimensions.dart';
import 'item_card_data.dart';

// ignore: must_be_immutable
class MenuItemCard extends StatelessWidget with GetItMixin {
  MenuItemCard(this.itemcard, {Key? key}) : super(key: key);

  final ItemCardData itemcard;

  @override
  Widget build(BuildContext context) {
    watchX((AppController ctrl) => ctrl.isoveritemcard);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        appController.isoveritemcard.value = true;
      },
      onExit: (event) {
        appController.isoveritemcard.value = false;
      },
      child: buildCard(context: context, itemdata: itemcard),
    );
  }

  Widget buildCard({required BuildContext context, required ItemCardData itemdata}) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        itemdata.onClicked(context);
      },
      child: SizedBox(
        width: screenSize.width < Dimensions.mobileWidth ? 300 : 400,
        height: screenSize.width < Dimensions.mobileWidth ? 80 : 100,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 2.0, left: 4.0, right: 4.0),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Image.asset(Constants.woodplankBrownPath, width: screenSize.width < Dimensions.mobileWidth ? 300 : 400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(top: screenSize.width < Dimensions.mobileWidth ? 34 : 40),
                        child: Text(
                          itemdata.title,
                          style: TextStyle(
                            color: Colors.black87.withOpacity(0.8),
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Kartun',
                            fontSize: screenSize.width < Dimensions.mobileWidth ? 14 : 20,
                          ),
                        ),
                      ),
                    ),
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
