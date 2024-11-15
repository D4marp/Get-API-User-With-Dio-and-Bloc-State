// user_state.dart
part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;

  UserLoaded({required this.users});
}

class UserError extends UserState {
  final String error;

  UserError({required this.error});
}
