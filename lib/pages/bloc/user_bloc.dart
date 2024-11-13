
import 'package:belajar_bloc_state/data/datasource/remote_datasource.dart';
import 'package:belajar_bloc_state/data/model/user.dart';
import 'package:flutter/foundation.dart';
import  'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';
class UserBloc extends Bloc<UserEvent, UserState> {
  final RemoteDatasource remoteDatasource;

  UserBloc({required this.remoteDatasource}) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final dataUser = await remoteDatasource.getUsers();
        emit(UserLoaded(users: dataUser.users));
      } catch (error) {
        emit(UserError(error: error.toString()));
      }
    });
  }
}

