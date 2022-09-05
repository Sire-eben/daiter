import 'package:daiter/blocs/swipe/swipe_bloc.dart';
import 'package:daiter/config/app_router.dart';
import 'package:daiter/config/theme.dart';
import 'package:daiter/models/user_model.dart';
import 'package:daiter/screens/home/home_screen.dart';
import 'package:daiter/screens/screens.dart';
import 'package:daiter/screens/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SwipeBloc>(
          create: (_) => SwipeBloc()..add(LoadUsersEvent(users: users)),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: OnboardingScreen.routeName,
      ),
    );
  }
}
