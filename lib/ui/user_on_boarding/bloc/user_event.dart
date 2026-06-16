abstract class UserEvent{}

class LoginUserEvent extends UserEvent{
  String email, password;
  LoginUserEvent({required this.email, required this.password});
}

class SignUpUserEvent extends UserEvent{
  String name, email, mobNo, password;
  SignUpUserEvent({required this.name, required this.email, required this.mobNo, required this.password});
}