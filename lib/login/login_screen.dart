import 'package:flutter/material.dart';
import 'package:trace_app/login/user_password.dart';
import 'package:trace_app/screens/dashboard_screen.dart';
// import 'package:trace_app/screens/register_next_entity_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController enterName = TextEditingController();
final TextEditingController enterPass = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // textAlign: TextAlign.start,
                  'Login',
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 70),
                TextField(
                  controller: enterName,
                  decoration: InputDecoration(
                    labelText: 'Usernane',
                    hintText: 'e.g Isabelle Kabore',
                    border: OutlineInputBorder(
                      // borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                TextField(
                  obscureText: true,
                  controller: enterPass,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '*********',
                    hintText: 'password',
                  ),
                ),
                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height: 1, width: 150, color: Colors.grey),
                    Text(" Or "),
                    Container(height: 1, width: 150, color: Colors.grey),
                    // Divider(),
                  ],
                ),

                SizedBox(height: 20),

                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(325, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (authenticateUserPassword(
                          enterName.text,
                          enterPass.text,
                        ) ==
                        null) {
                      const snackBar = SnackBar(
                        content: Text(
                          'Invalid username or password',
                        ),
                        duration: Duration(seconds: 5),
                        backgroundColor: Colors.amber,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DashboardScreen(userName: enterName.text.trim());
                          },
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Login with Government ID',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),

                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Color(0xffAEAEB2),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
