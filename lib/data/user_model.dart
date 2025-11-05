import '../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json['results'][0]['name']['first']);
  }
}
