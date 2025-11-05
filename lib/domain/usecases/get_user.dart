import 'package:dartz/dartz.dart';
import '../../core/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;
  GetUser(this.repository);

  Future<Either<Failure, UserEntity>> call() async {
    return await repository.getRandomUser();
  }
}
