import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:animate_do/animate_do.dart';

import '../core/locator.dart';
import '../core/dimensions.dart';
import '../core/extensions/hover_extensions.dart';
import '../themes/themes.dart';
import '../app/widgets/app_drawer.dart';
import '../app/widgets/app_top_bar.dart';
import '../app/widgets/app_bottom_bar.dart';
import 'widgets/item_card_data.dart';
import 'widgets/menu_item_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const routeName = 'home';
  final List<ItemCardData> activities = ItemCardData.allItemsData;

  @override
  Widget build(BuildContext context) {
    debugPrint('HomePage.build');
    appController.setTabbarIndex(0);

    const double opacity = 1;
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: screenSize.width < Dimensions.mobileWidth
          ? AppBar(
              elevation: 0,
              centerTitle: true,
              actions: const [
                //LanguagePopup(),
                SizedBox(width: 5),
              ],
              title: const Text(''),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: AppTopBar(opacity),
            ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: screenSize.width < Dimensions.mobileWidth ? screenSize.height * 0.08 : screenSize.height * 0.1),
                    FadeInUp(
                      delay: const Duration(milliseconds: 500),
                      child: AvatarGlow(
                        endRadius: screenSize.width < Dimensions.mobileWidth ? 70 : 100,
                        duration: const Duration(seconds: 2),
                        glowColor: Colors.white24,
                        repeat: true,
                        repeatPauseDuration: const Duration(seconds: 1),
                        startDelay: const Duration(seconds: 1),
                        child: Material(
                          elevation: 8.0,
                          shape: const CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            radius: screenSize.width < Dimensions.mobileWidth ? 40 : 70.0,
                            child: SvgPicture.asset('assets/images/ApitepBear.svg', height: screenSize.width < Dimensions.mobileWidth ? 50 : 90),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 1200),
                        child: SvgPicture.asset('assets/images/apitep.svg', height: screenSize.width < Dimensions.mobileWidth ? 55 : 90),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    FadeInUp(
                      delay: const Duration(milliseconds: 1600),
                      child: Text(
                        "Apprendre à petit pas",
                        textAlign: TextAlign.center,
                        style: Themes.textTheme.headline4?.copyWith(letterSpacing: 3, color: Colors.blueGrey[200]),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 0.0,
                      runSpacing: 5.0,
                      children: activities.map((item) {
                        return MenuItemCard(item).showCursorOnHover.moveUpOnHover;
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 0,
            child: AppBottomBar(),
          ),
        ],
      ),
    );
  }
}
