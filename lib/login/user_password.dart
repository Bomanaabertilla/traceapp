// import 'package:trace_app/screens/register_entity_next_screen.dart';

class UserPassword {
  final String username;
  final String password;

  UserPassword({required this.username, required this.password});
}

final List<UserPassword> dummyUserList = [
  UserPassword(username: 'berti', password: 'bomanaa'),
  UserPassword(username: 'bertilla@vitara.ag', password: 'berti123@boma'),
];

UserPassword? authenticateUserPassword(
  String inputUsername,
  String inputPassword,
) {
  final username = inputUsername.trim();
  final userpassword = inputPassword.trim();

  for (var user in dummyUserList) {
    if (user.username == username && user.password == userpassword) {
      return user;
    }
  }
  return null;
}
