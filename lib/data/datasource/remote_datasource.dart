import 'package:belajar_bloc_state/data/model/user.dart';
import 'package:dio/dio.dart';

class RemoteDatasource {
  final dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));

  Future<DataUser>getUsers()async{
    final response = await dio.get('/users');
    return DataUser.fromJson(response.data);
  }
}