import 'package:flutter/material.dart';
import 'package:trace_app/registration_success.dart';

class RegisterAggregatorPage extends StatefulWidget {
  const RegisterAggregatorPage({super.key});

  @override
  State<RegisterAggregatorPage> createState() => _RegisterAggregatorPageState();
}

class _RegisterAggregatorPageState extends State<RegisterAggregatorPage> {
  String operationType = "Select an option";
  bool imagesCaptured = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register new entity")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Register aggregator",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            buildField("Enter your organization name here"),
            buildField("Who should we contact?"),
            buildField("Your phone number"),
            buildField("e.g. 90000"),
            buildField("Enter amount in GHC"),

            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: operationType,
              items: const [
                DropdownMenuItem(
                  value: "Select an option",
                  child: Text("Select an option"),
                ),
                DropdownMenuItem(
                  value: "Market aggregation",
                  child: Text("Market aggregation"),
                ),
                DropdownMenuItem(
                  value: "Processing",
                  child: Text("Processing"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  operationType = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: "Operation type",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Business registration",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                setState(() {
                  imagesCaptured = true;
                });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: imagesCaptured ? Colors.green : Colors.grey,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Icon(
                      imagesCaptured ? Icons.check_circle : Icons.camera_alt,
                      color: imagesCaptured ? Colors.green : Colors.red,
                      size: 40,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      imagesCaptured ? "6 images captured" : "Tap to capture",
                      style: TextStyle(
                        color: imagesCaptured ? Colors.green : Colors.red,
                      ),
                    ),
                    if (imagesCaptured)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            imagesCaptured = false;
                          });
                        },
                        child: const Text("Clear images"),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegistrationSuccessPage(),
                    ),
                  );
                },
                child: const Text("Register entity"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
