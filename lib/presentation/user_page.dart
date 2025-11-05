import 'package:flutter/material.dart';
import '../domain/usecases/get_user.dart';
import '../data/user_repository_impl.dart';
import '../core/failure.dart';
import '../domain/entities/user_entity.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _repository = UserRepositoryImpl();
  String _status = "Press the button to fetch user";

  Future<void> _fetchUser() async {
    final usecase = GetUser(_repository);
    final result = await usecase();

    result.fold(
      (Failure failure) {
        setState(() {
          _status = "❌ Error: ${failure.message}";
        });
      },
      (UserEntity user) {
        setState(() {
          _status = "✅ User fetched: ${user.name}";
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dartz Example")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _status,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchUser,
                child: const Text("Fetch Random User"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
