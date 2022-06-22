
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/locator.dart';
import '../../themes/themes.dart';
import '../../about/about_page.dart';
import '../../home/home_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: AvatarGlow(
                  endRadius: 60,
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
                      radius: 70.0,
                      child: SvgPicture.asset('assets/images/ApitepBear.svg', height: 80),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Champion du monde",
                    textAlign: TextAlign.center,
                    style: Themes.textTheme.bodyText1?.copyWith(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height:30),
              InkWell(
                onTap: () {
                  appController.setTabbarIndex(0);
                  context.goNamed(HomePage.routeName);
                  if (Navigator.canPop(context)) Navigator.of(context).pop();
                },
                child: const Text(
                  'Accueil',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    letterSpacing: .5,
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  appController.setTabbarIndex(2);
                  context.goNamed(AboutPage.routeName);
                  if (Navigator.canPop(context)) Navigator.of(context).pop();
                },
                child: const Text(
                  'A propos',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    letterSpacing: .5,
                  ),
                ),
              ),
              const Divider(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      if (FirebaseAuth.instance.currentUser == null) {
                        if (Navigator.canPop(context)) Navigator.of(context).pop();
                        context.goNamed(HomePage.routeName);
                      } else {
                        if (Navigator.canPop(context)) Navigator.of(context).pop();
                        await authController.signout();
                        appController.setTabbarIndex(0);
                      }
                    },
                    child: Text(
                      FirebaseAuth.instance.currentUser == null ? 'Se connecter' : 'Se déconnecter',
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: .5,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'info@ericnahon.dev',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
