import 'package:flutter/material.dart';
import 'package:trace_app/login/login_screen.dart';
import 'package:trace_app/screens/dashboard_screen.dart';
import 'package:trace_app/screens/register_next_entity_screen.dart';
import 'package:trace_app/screens/uuid_screen.dart';
// import 'package:uuid/data.dart';
// import 'package:uuid/uuid.dart';

class FinalEntityRegisterScreen extends StatefulWidget {
  const FinalEntityRegisterScreen({super.key});

  @override
  State<FinalEntityRegisterScreen> createState() =>
      _FinalEntityRegisterScreenState();
}

class _FinalEntityRegisterScreenState extends State<FinalEntityRegisterScreen> {
  // var uuid = Uuid();
  // late var v1 = uuid.v1();
  // late var v1Exact = uuid.v1(
  //   config: V1Options(0, DateTime.utc(2025).day, 0, [0], null),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset('assets/images/icons/Frame.png', width: 98, height: 98),
            Text(
              'Success',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xff333333),
              ),
            ),

            Text(
              'Entity has been registered',
              style: TextStyle(fontSize: 16, color: Color(0xff667185)),
            ),
            Text(
              'Registration ID: AGG-${generatedCustomID()}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            Spacer(),
            Divider(),
            SizedBox(height: 20),

            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
                ),
                fixedSize: Size(280, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        DashboardScreen(userName: enterName.text.trim()),
                  ),
                );
              },
              child: Text(
                'Back to dashboard',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  //   backgroundColor: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 20),

            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
                ),
                fixedSize: Size(280, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return RegisterEntityNextScreen();
                    },
                  ),
                );
              },
              child: Text(
                'Register another',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  //   backgroundColor: Colors.black,
                  // color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
