// user_event.dart
part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class FetchUsers extends UserEvent {}
