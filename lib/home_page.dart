import 'package:flutter/material.dart';
import 'package:trace_app/register_new_entity.dart';
import 'package:trace_app/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget menuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 20),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        centerTitle: true,
        title: const Text("Dashboard"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              );
          }, icon: Icon(Icons.account_circle),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome, Caroline Diallo",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "District: Central Region",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 35),

            menuItem(context, Icons.add_box, "Register new entity", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RegisterEntityPage()),
              );
            }),
            const SizedBox(height: 35),
            menuItem(context, Icons.local_shipping, "Record shipment", () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RegisterEntityPage()),
              );
            }),
            const SizedBox(height: 35),
            menuItem(context, Icons.verified, "In-transit verification", () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RegisterEntityPage()),
              );
            }),
            const SizedBox(height: 35),
            menuItem(
              context,
              Icons.inventory,
              "Destination verification",
              () {},
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Entities"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Reports",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
