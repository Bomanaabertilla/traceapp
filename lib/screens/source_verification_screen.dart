import 'package:flutter/material.dart';
import 'package:trace_app/screens/search_bar.dart';
import 'package:trace_app/screens/scan_screen.dart';
// import 'package:trace_app/screens/recent_entries_screen.dart';
// import 'package:trace_app/screens/register_entity_next_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'commodity_details_screen.dart';

class SourceVerificationScreen extends StatefulWidget {
  const SourceVerificationScreen({super.key});

  @override
  State<SourceVerificationScreen> createState() =>
      _SourceVerificationScreenState();
}

class RecentD {
  String? title;
  String? subTile;
  IconData? icon;
}

class _SourceVerificationScreenState extends State<SourceVerificationScreen> {
  String? scannedCode;
  // String? _latestEntry;
  List<String> recentEntries = [];
  // String bullet = TextField.obscuringCharacter;

  @override
  void initState() {
    super.initState();
    _loadRecentEntries();
  }

  Future<void> _loadRecentEntries() async {
    final prefs = await SharedPreferences.getInstance();
    // final orgName = prefs.getString('latest_org_name');
    final List<String>? savedEntries = prefs.getStringList('recent_entries');
    // final date = prefs.getString('latest_reg_date');

    if (savedEntries != null && mounted) {
      setState(() {
        recentEntries = savedEntries;
      });
    }
  }

  void _onRecentEntryTapped(String entry) {
    final parts = entry.split('  ');
    final String orgName = parts.isNotEmpty
        ? parts[0].trim()
        : 'Unknown Entity';
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            CommodityDetailsScreen(organizationName: orgName),
      ),
    );
  }

  // CommodityDetailsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Source verification',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Find Entity',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              const SizedBox(height: 4),
              const Text('Scan QR code or search'),

              const SizedBox(height: 20),
              SearchBarFilter(),

              const SizedBox(height: 40),

              QrScanBar(
                onScanned: (value) {
                  setState(() {
                    scannedCode = value;
                  });
                },
              ),

              if (scannedCode != null) ...[
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Scanned Code: $scannedCode',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ],

              SizedBox(height: 50),

              Text(
                'Recent entries',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              SizedBox(height: 10),

              // RecentEntriesScreen(),
              if (recentEntries.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('No Entries yet', style: TextStyle(fontSize: 18)),
                )
              else
                ...List.generate(recentEntries.length, (index) {
                  final entry = recentEntries[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: InkWell(
                      onTap: () => _onRecentEntryTapped(entry),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                entry,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  );
                }),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
