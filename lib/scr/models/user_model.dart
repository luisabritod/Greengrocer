import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'fullname')
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? id;
  String? token;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.cpf,
    this.password,
    this.id,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? cpf,
    String? password,
    String? id,
    String? token,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      password: password ?? this.password,
      id: id ?? this.id,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phone: $phone, cpf: $cpf, password: $password, id: $id, token: $token)';
  }
}
