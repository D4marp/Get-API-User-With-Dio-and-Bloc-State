import 'package:belajar_bloc_state/data/datasource/remote_datasource.dart';
import 'package:belajar_bloc_state/pages/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(remoteDatasource: RemoteDatasource())..add(FetchUsers()),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text(
            'User List',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          elevation: 2,
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserError) {
              return Center(child: Text(state.error, style: const TextStyle(color: Colors.red, fontSize: 16)));
            } else if (state is UserLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(12.0),
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(user.avatar),
                        backgroundColor: Colors.grey[300],
                      ),
                      title: Text(
                        '${user.firstName} ${user.lastName}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      subtitle: Text(
                        user.email,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                      onTap: () {
                        // Handle tap if needed, e.g., navigate to detail page
                      },
                    ),
                  );
                },
              );
            }
            // Jika state tidak dikenali atau data kosong
            return const Center(child: Text('No data available', style: TextStyle(fontSize: 16)));
          },
        ),
      ),
    );
  }
}
