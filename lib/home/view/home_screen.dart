import 'package:flutter/material.dart';
import 'package:trace_app/login/login_screen.dart';
import 'package:trace_app/screens/source_verification_screen.dart';
import 'package:trace_app/widgets/icon_widgets.dart';
import 'package:trace_app/screens/register_entity_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listView = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 28,
          color: Colors.black,
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       LoginScreen();
        //     },
        //     icon: Icon(Icons.account_circle),
        //   ),
        // ],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreen(),
                ),
              );
            },
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),

      // body: ListView.builder(
      //   itemCount: 4,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Column(
      //       children: [
      //         ListTile(
      //           leading: const Icon(Icons.add),
      //           trailing: const Icon(Icons.chevron_right_outlined),
      //           title: Text('Register new entity'),
      //         ),
      //       ],
      //     );
      //   },
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                'Welcome, ${enterName.text.trim()}',
                style: TextStyle(
                  height: 2,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(206, 0, 0, 0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                'District: Central Region',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
            // for (final list in listView) Text(list),
            SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                children: [
                  TransitCardWidget(
                    // icon: Icons.abc_outlined,
                    image: 'assets/images/icons/add_box.png',
                    title: 'Register new entity',
                    subTitle: 'Add new stakeholders',
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const RegisterEntityScreen(),
                        ),
                      );
                    },
                  ),
                  // Divider(),
                  TransitCardWidget(
                    // icon: Icons.add_box_outlined,
                    image: "assets/images/icons/local_shipping.png",
                    title: 'Record shipment',
                    subTitle: 'Record commodity movement',
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return SourceVerificationScreen();
                          },
                        ),
                      );
                    },
                  ),
                  TransitCardWidget(
                    // icon: Icons.abc_outlined,
                    image: 'assets/images/icons/delivery_truck_speed.png',
                    title: 'In-transit verification',
                    subTitle: 'Record commodity in transit',
                    onClick: () {
                      // Icons.arrow_back;
                    },
                  ),
                  // Divider(),
                  TransitCardWidget(
                    image: 'assets/images/icons/inventory.png',
                    // icon: Icons.add_box_outlined,
                    title: 'Destination verification',
                    subTitle: 'Verify shipment at destination',
                  ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.add_box_outlined,
                  //     color: Colors.grey.shade600,
                  //   ),
                  //   trailing: const Icon(Icons.chevron_right_outlined),
                  //   title: Text(
                  //     'Register new entity',
                  //     style: TextStyle(
                  //       color: const Color(0xFF000000),
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   subtitle: Text('Add a new entity to the system'),
                  // ),
                  // Divider(),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.local_shipping,
                  //     color: Colors.grey.shade600,
                  //   ),
                  //   trailing: const Icon(Icons.chevron_right_outlined),
                  //   title: Text(
                  //     'Record shipment',
                  //     style: TextStyle(
                  //       color: const Color(0xFF000000),
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   subtitle: Text('Record commodity movement'),
                  // ),
                  // Divider(),
                  // ListTile(
                  //   leading: Image.asset(
                  //     'assets/images/icons/delivery_truck_speed.png',
                  //     width: 25,
                  //     height: 25,
                  //     color: Colors.grey.shade600,
                  //   ),
                  //   trailing: const Icon(Icons.chevron_right_outlined),
                  //   title: Text(
                  //     'In-transit verification',
                  //     style: TextStyle(
                  //       color: const Color(0xFF000000),
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   subtitle: Text('Verify commodity in-transit'),
                  // ),
                  // Divider(),
                  // ListTile(
                  //   leading: Icon(Icons.add_box, color: Colors.grey.shade600),
                  //   trailing: const Icon(Icons.chevron_right_outlined),
                  //   title: Text(
                  //     'Destination verification',
                  //     style: TextStyle(
                  //       color: const Color(0xFF000000),
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   subtitle: Text('Verify shipment at destination'),
                  // ),
                ],
              ),
            ),

            // ListTile(
            //   leading: Icon(
            //     Icons.add_box_outlined,
            //     color: Colors.grey.shade600,
            //   ),
            //   trailing: const Icon(Icons.chevron_right_outlined),
            //   title: Text(
            //     'Register new entity',
            //     style: TextStyle(
            //       color: const Color(0xFF000000),
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),

            // ListTile(
            //   leading: const Icon(Icons.local_shipping),
            //   trailing: const Icon(Icons.chevron_right_outlined),
            //   title: Text(
            //     'Record shipment',
            //     style: TextStyle(
            //       color: const Color(0xFF000000),
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),

            // ListTile(
            //   leading: Image.asset(
            //     'assets/images/icons/delivery_truck_speed.png',
            //     width: 20,
            //     height: 20,
            //   ),
            //   trailing: const Icon(Icons.chevron_right_outlined),
            //   title: Text(
            //     'In-transit verification',
            //     style: TextStyle(
            //       color: const Color(0xFF000000),
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),

            // ListTile(
            //   leading: const Icon(Icons.add_box),
            //   trailing: const Icon(Icons.chevron_right_outlined),
            //   title: Text(
            //     'Destination verification',
            //     style: TextStyle(
            //       color: const Color(0xFF000000),
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),

      // children: [
      //   Text(
      //     'Welcome, Caroline Diallo',
      //     style: TextStyle(
      //       height: 2,
      //       fontSize: 24,
      //       fontWeight: FontWeight.bold,
      //       color: const Color.fromARGB(206, 0, 0, 0),
      //     ),
      //   ),
      //   Text(
      //     'District: Central Region',
      //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      //   ),
      // ],

      // child: Text(
      //   'Welcome, Caroline Diallo \n District: Central Region',
      //   style: TextStyle(color: Colors.black),
      // ),
      // child: Column(
      //   children: [
      //     Text(
      //       'Welcome, Caroline Diallo',
      //       style: TextStyle(
      //         height: 2,
      //         fontSize: 24,
      //         fontWeight: FontWeight.bold,
      //         color: const Color.fromARGB(206, 0, 0, 0),
      //       ),
      //     ),
      //     Text(
      //       'District: Central Region',
      //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      //     ),
      //   ],
      // ),
    );
  }
}
