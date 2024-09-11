part of 'bloc.dart';

class LoginEvents {}
class LoginEvent extends LoginEvents {
  final String phone, code, password;
  LoginEvent({required this.phone, required this.code, required this.password});
}