import 'package:built_value/built_value.dart';

part 'user_model.g.dart';

abstract class UserModel implements Built<UserModel, UserModelBuilder> {

  String get name;

  String get email;

  factory UserModel.from(String name, String email) {
    return UserModel(
      (b) => b
        ..name = name
        ..email = email,
    );
  }

  factory UserModel([void Function(UserModelBuilder) updates]) = _$UserModel;

  UserModel._();
}
