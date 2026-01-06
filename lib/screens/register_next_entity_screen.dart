import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trace_app/image_field_screen.dart';
import 'package:trace_app/screens/final_entity_register_screen.dart';

class RegisterEntityNextScreen extends StatefulWidget {
  const RegisterEntityNextScreen({super.key});

  @override
  State<RegisterEntityNextScreen> createState() {
    return _RegisterEntityNextScreenState();
  }
}

TextEditingController userInput = TextEditingController();

// Color c1 = Colors.amber;
// Color? selectedColor;
// String dropdownValue = 'Market Aggregation';
String? selectedAggregatorType;

class _RegisterEntityNextScreenState extends State<RegisterEntityNextScreen> {
  final TextEditingController orgNameController = TextEditingController();
  DateTime registrationDate = DateTime.now();

  String formatDate(DateTime date) {
    return '${_monthName(date.month)} ${date.day}, ${date.year}';
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Register new entity',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 79),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Register aggregator',
                          style: TextStyle(fontSize: 26),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: TextField(
                      controller: orgNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your organization name here',
                        labelText: 'Your name goes here',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: TextField(
                      // controller: userInput,
                      decoration: InputDecoration(
                        hintText: 'Who should we contact?',
                        labelText: 'Contact person\'s name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: TextField(
                      // controller: userInput,
                      decoration: InputDecoration(
                        hintText: 'Your phone number',
                        labelText: 'Enter a valid number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: TextField(
                      // controller: userInput,
                      decoration: InputDecoration(
                        hintText: 'e.g 00000',
                        labelText: 'Tax Identification Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: TextField(
                      // controller: userInput,
                      decoration: InputDecoration(
                        hintText: 'Enter amount in GH',
                        labelText: 'Registration fee',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: DropdownMenu<String>(
                      initialSelection: selectedAggregatorType,
                      onSelected: (String? newValue) {
                        setState(() {
                          selectedAggregatorType = newValue;
                        });
                      },
                      label: const Text('Select an option'),
                      // hintText: 'Aggregation type',

                      // enableSearch: true,
                      width: MediaQuery.sizeOf(context).width,
                      // width: 280,
                      inputDecorationTheme: const InputDecorationTheme(
                        border: OutlineInputBorder(),
                      ),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(
                          value: 'Market Aggregation',
                          label: 'Market Aggregation',
                        ),
                        DropdownMenuEntry(
                          value: 'Aggregation',
                          label: 'Aggregation',
                        ),
                        DropdownMenuEntry(value: 'Market', label: 'Market'),
                      ],
                    ),
                  ),

                  // DropdownMenu(
                  //   enableSearch: true,
                  //   hintText: 'Tap to select',
                  //   dropdownMenuEntries: <DropdownMenuEntry<Color>>[
                  //     DropdownMenuEntry(
                  //       value: Colors.grey,
                  //       label: 'Market aggregation',
                  //     ),
                  //     DropdownMenuEntry(
                  //       value: Colors.grey,
                  //       label: 'Market aggregation',
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 20),

                  ImageFieldScreen(),

                  SizedBox(height: 20),

                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () async {
                        final String organizationName = orgNameController.text
                            .trim();
                        if (organizationName.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.deepOrangeAccent,
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                ),
                              ),
                              content: Text('Please Enter organization name'),
                            ),
                          );
                          return;
                        }

                        final String formattedDate = formatDate(
                          registrationDate,
                        );
                        final String entry =
                            '$organizationName . $formattedDate';

                        final prefs = await SharedPreferences.getInstance();
                        List<String> recentEntries =
                            prefs.getStringList('recent_entries') ?? [];
                        recentEntries.insert(0, entry);

                        if (recentEntries.length > 10) {
                          recentEntries = recentEntries.sublist(0, 10);
                        }

                        await prefs.setStringList(
                          'recent_entries',
                          recentEntries,
                        );

                        // Go to success screen
                        await Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const FinalEntityRegisterScreen(),
                          ),
                        );

                        // await prefs.setString(
                        //   'latest_org_name',
                        //   organizationName,
                        // );
                        // await prefs.setString('latest_reg_date', formattedDate);

                        // await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //         const FinalEntityRegisterScreen(),
                        //   ),
                        // );

                        if (mounted) {
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        }
                        // final result = <String, String>{
                        //   'orgName': organizationName,
                        //   'date': formatDate(registrationDate),
                        // };
                        // await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => const FinalEntityRegisterScreen(),
                        //   ),
                        // );
                        // Navigator.pop(context, result);
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Register entity',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
