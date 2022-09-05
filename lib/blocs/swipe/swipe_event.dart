part of 'swipe_bloc.dart';

abstract class SwipeEvent extends Equatable {
  const SwipeEvent();

  @override
  List<Object> get props => [];
}

class LoadUsersEvent extends SwipeEvent {
  final List<UserModel> users;

  const LoadUsersEvent({required this.users});

  @override
  List<Object> get props => [users];
}

class SwipeLeftEvent extends SwipeEvent {
  final UserModel user;

  const SwipeLeftEvent({required this.user});

  @override
  List<Object> get props => [user];
}

class SwipeRightEvent extends SwipeEvent {
  final UserModel user;

  const SwipeRightEvent({required this.user});

  @override
  List<Object> get props => [user];
}
