import 'package:flutter/material.dart';

import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/locator.dart';
import '../../../app/app_controller.dart';
import '../../../themes/themes.dart';
import '../../about/about_page.dart';
import '../../home/home_page.dart';

enum UserMenuOptions { login, logout, account }

class AppTopBar extends StatefulWidget with GetItStatefulWidgetMixin {
  AppTopBar(this.opacity, {Key? key}) : super(key: key);

  final double opacity;

  @override
  State<AppTopBar> createState() => _AppTopBarState();
}

class _AppTopBarState extends State<AppTopBar> with GetItStateMixin, TickerProviderStateMixin {
  TabController? tabController;
  late int topbarTabLength;

  @override
  void initState() {
    super.initState();
    appController.updateTabs();
    topbarTabLength = appController.tabs.length;
    tabController = TabController(vsync: this, length: topbarTabLength);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    tabController?.index = appController.topbarTabIndexProvider.value;

    watchX((AppController ctrl) => ctrl.topbarTabIndexProvider);

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Themes.kApitepDarkBgColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Constants.title,
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.5,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TabBar(
                      controller: tabController,
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.blueGrey[100],
                      unselectedLabelColor: Colors.grey.withOpacity(0.6),
                      isScrollable: true,
                      onTap: (index) {
                        setState(() {
                          appController.setTabbarIndex(index);
                          switch (index) {
                            case 0:
                              context.goNamed(HomePage.routeName);
                              break;
                            case 1:
                              context.goNamed(AboutPage.routeName);
                              break;
                            default:
                              context.goNamed(HomePage.routeName);
                          }
                        });
                      },
                      tabs: appController.getTabs(),
                    ),
                    const SizedBox(width: 16),
                    //const AccountPopupMenu(),
                  ],
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
