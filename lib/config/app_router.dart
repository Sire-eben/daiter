import 'package:daiter/screens/screens.dart';
import 'package:flutter/material.dart';

import '/models/models.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    print(settings);
    switch (settings.name) {
      case '/':
        return HomeScreen.route();

      case UsersScreen.routeName:
        return UsersScreen.route(user: settings.arguments as UserModel);
      case OnboardingScreen.routeName:
        return OnboardingScreen.route();
      // case MatchesScreen.routeName:
      //   return MatchesScreen.route();
      // case ProfileScreen.routeName:
      //   return ProfileScreen.route();
      // case ChatScreen.routeName:
      //   return ChatScreen.route(userMatch: settings.arguments as UserMatch);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: Text('error'))),
      settings: RouteSettings(name: '/error'),
    );
  }
}
