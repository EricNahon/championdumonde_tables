import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/locator.dart';
import '../themes/themes.dart';

class AppController with ChangeNotifier {
  AppController() {
    _tabs = getTabs();
    soundController.initTts();
  }

  final isBootstrapComplete = ValueNotifier<bool>(false);
  final isoveritemcard = ValueNotifier<bool>(false);
  final topbarTabIndexProvider = ValueNotifier<int>(0);

  Future<void> bootstrap() async {
    //await settingsController.loadSettings();
    isBootstrapComplete.value = true;
  }

  void setTabbarIndex(int index) {
    topbarTabIndexProvider.value = index;
    //if (homepagecontroller.hasClients) homepagecontroller.jumpToPage(index);
    notifyListeners();
  }

  List<Widget> _tabs = [];
  List<Widget> get tabs {
    return _tabs;
  }

  set tabs(List<Widget> value) {
    _tabs = value;
    notifyListeners();
  }

  void updateTabs() {
    tabs = getTabs();
    notifyListeners();
  }

  List<Widget> getTabs() {
    List<Widget> tabs = [];
    tabs.add(Tab(child: Text('Accueil', style: Themes.popupTextStyle)));
    tabs.add(Tab(child: Text('A propos', style: Themes.popupTextStyle)));
    return tabs;
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
