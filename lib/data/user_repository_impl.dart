import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import '../core/failure.dart';
import '../domain/entities/user_entity.dart';
import '../domain/repositories/user_repository.dart';
import 'user_model.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, UserEntity>> getRandomUser() async {
    try {
      final response = await http.get(Uri.parse("https://randomuser.me/api/"));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final user = UserModel.fromJson(jsonData);
        return right(user);
      } else {
        return left(Failure("Failed to fetch user: ${response.statusCode}"));
      }
    } catch (e) {
      return left(Failure("Network error: $e"));
    }
  }
}
