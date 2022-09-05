import 'package:daiter/models/user_model.dart';
import 'package:daiter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  final UserModel user;

  const UsersScreen({super.key, required this.user});

  static const String routeName = '/users';

  static Route route({required UserModel user}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => UsersScreen(user: user),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Hero(
                  tag: 'user_image',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          user.imageUrls[0],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceButton(
                          icon: Icons.clear_rounded,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const ChoiceButton(
                          height: 80,
                          width: 80,
                          size: 30,
                          hasGradient: true,
                          icon: Icons.favorite_outline,
                          color: Colors.white,
                        ),
                        ChoiceButton(
                          icon: Icons.watch_later,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}, ${user.age}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  user.jobTitle,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
                const SizedBox(height: 15),
                Text(
                  'About',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  user.bio,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(height: 2),
                ),
                const SizedBox(height: 15),
                Text(
                  'Interests',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Row(
                  children: user.interests
                      .map((interest) => Container(
                            padding: const EdgeInsets.all(5.0),
                            margin: const EdgeInsets.only(top: 5.0, right: 5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(colors: [
                                  Theme.of(context).primaryColor,
                                  Theme.of(context).colorScheme.secondary,
                                ])),
                            child: Text(interest,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white)),
                          ))
                      .toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
