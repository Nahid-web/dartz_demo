import 'package:dartz/dartz.dart';
import '../../core/failure.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getRandomUser();
}
