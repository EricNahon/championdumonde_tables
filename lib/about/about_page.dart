import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/locator.dart';
import '../core/dimensions.dart';
import '../themes/themes.dart';
import '../app/widgets/app_top_bar.dart';
import '../app/widgets/app_drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  static const routeName = 'about';

  @override
  Widget build(BuildContext context) {
    appController.setTabbarIndex(1);
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: MediaQuery.of(context).size.width < Dimensions.mobileWidth
          ? AppBar(
              elevation: 0,
              centerTitle: true,
              actions: const [
                //LanguagePopup(),
                SizedBox(width: 5),
              ],
              title: Text(
                Constants.title,
                style: Themes.textTheme.headline4,
              ),
            )
          : PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 1000),
              child: AppTopBar(1),
            ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          '${Constants.webAppname} v${Constants.webVersion}.${Constants.webBuild} - ${Constants.contactmail}',
          style: textTheme.bodyText1?.copyWith(color: Colors.white60),
        ),
      ),
    );
  }
}
