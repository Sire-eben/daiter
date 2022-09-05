import 'package:daiter/blocs/swipe/swipe_bloc.dart';
import 'package:daiter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'DISCOVER',
        hasActions: true,
      ),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwipeLoaded) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  InkWell(
                    onDoubleTap: () {
                      Navigator.pushNamed(context, '/users',
                          arguments: state.users[0]);
                    },
                    child: Draggable(
                      feedback: UserCard(
                        user: state.users[0],
                      ),
                      childWhenDragging: UserCard(user: state.users[1]),
                      onDragEnd: (drag) {
                        if (drag.velocity.pixelsPerSecond.dx < 0) {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeLeftEvent(user: state.users[0]));
                          print('Swiped left');
                        } else {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeRightEvent(user: state.users[0]));
                          print('Swiped right');
                        }
                      },
                      child: UserCard(user: state.users[0]),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<SwipeBloc>()
                                .add(SwipeLeftEvent(user: state.users[0]));
                            print('Swiped left');
                          },
                          child: ChoiceButton(
                            hasGradient: false,
                            width: 60,
                            height: 60,
                            size: 25,
                            color: Theme.of(context).colorScheme.secondary,
                            icon: Icons.clear_rounded,
                          ),
                        ),
                        const ChoiceButton(
                          hasGradient: true,
                          width: 80,
                          height: 80,
                          size: 30,
                          color: Colors.white,
                          icon: Icons.favorite,
                        ),
                        ChoiceButton(
                          hasGradient: false,
                          width: 60,
                          height: 60,
                          size: 25,
                          color: Theme.of(context).colorScheme.secondary,
                          icon: Icons.watch_later,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Text('something went wrong');
        },
      ),
    );
  }
}
