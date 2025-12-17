import 'package:flutter/material.dart';
import 'package:trace_app/register_aggregator.dart';

class RegisterEntityPage extends StatelessWidget {
  const RegisterEntityPage({super.key});

  Widget entityItem(String title, IconData icon, void Function()? ontap) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: ontap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register new entity",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Please select the entity type to register",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            entityItem("Aggregator", Icons.business, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RegisterAggregatorPage()),
              );
            }),
            entityItem("SME", Icons.store, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RegisterEntityPage()),
              );
            }),
            entityItem("Cooperative", Icons.groups, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RegisterEntityPage()),
              );
            }),
            entityItem("Transporter", Icons.local_shipping, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RegisterEntityPage()),
              );
            }),
          ],
        ),
      ),
    );
  }
}
