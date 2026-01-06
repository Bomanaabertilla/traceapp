import 'package:flutter/material.dart';
import 'package:trace_app/screens/register_next_entity_screen.dart';
// import 'package:trace_app/screens/register_entity_next_screen.dart';

class RecentEntriesScreen extends StatelessWidget {
  const RecentEntriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push<Map<String, String>>(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    const RegisterEntityNextScreen(),
              ),
            );

            if (result != null) {
              debugPrint(result.toString());
            }
          },
          child: const Text('Register Entity'),
        ),
      ),
    );
  }
}



