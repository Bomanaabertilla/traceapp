import 'package:flutter/material.dart';
// import 'package:trace_app/widgets/icon_widgets.dart';
import 'package:trace_app/widgets/register_icon_widget.dart';
import 'package:trace_app/screens/register_next_entity_screen.dart';

class RegisterEntityScreen extends StatefulWidget {
  const RegisterEntityScreen({super.key});

  @override
  State<RegisterEntityScreen> createState() => _RegisterEntityScreen();
}

class _RegisterEntityScreen extends State<RegisterEntityScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Register new entity',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Please select the entity type to register',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff333333),
                ),
              ),
            ),

            // Padding(padding: EdgeInsets.all(20), child: Text('data')),
            RegisterIconWidget(
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return RegisterEntityNextScreen();
                    },
                  ),
                );
              },
              title: 'Agregator',
              image: 'assets/images/icons/account_box.png',
              // #F7F9FC
            ),
            RegisterIconWidget(
              image: 'assets/images/icons/store.png',
              title: 'SME',
              onClick: () {},
            ),
            RegisterIconWidget(
              title: 'Coorperative',
              onClick: () {},
              image: 'assets/images/icons/groups_2.png',
            ),
            RegisterIconWidget(
              image: 'assets/images/icons/delivery_truck_speed.png',
              title: 'Transporter',
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}
