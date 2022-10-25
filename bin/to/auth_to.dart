import 'dart:convert';

class AuthTO{
  final String email;
  final String password;

  AuthTO(this.email, this.password);

  factory AuthTO.fromRequest(String Body){
    var map = jsonDecode(Body);

    return AuthTO(map['email'], map['password']);
  }
}