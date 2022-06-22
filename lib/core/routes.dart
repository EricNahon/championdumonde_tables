
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../about/about_page.dart';
import '../../home/home_page.dart';

class Routes {
  static get routes => GoRouter(
        routes: [
          // Default
          GoRoute(
            path: '/',
            redirect: (_) =>  '/${HomePage.routeName}',
          ),
          // Home
          GoRoute(
            name: HomePage.routeName,
            path: '/${HomePage.routeName}',
            pageBuilder: (context, state) {
              return NoTransitionPage<void>(
                key: state.pageKey,
                child: HomePage(),
              );
            },
          ),
          // About
          GoRoute(
            name: AboutPage.routeName,
            path: '/${AboutPage.routeName}',
            pageBuilder: (context, state) {
              return NoTransitionPage<void>(
                key: state.pageKey,
                child: const AboutPage(),
              );
            },
          ),
        ],

        // redirect to the login page if the user is not logged in
        redirect: (state) {
          if (state.subloc == '/') {
            return '/${HomePage.routeName}'; // user is connected and heading to landing, let's redirect to home
          }
          // no need to redirect at all
          return null;
        },

        // changes on the listenable will cause the router to refresh it's route
        refreshListenable: GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()),
      );
}
