// import 'package:flutter/material.dart';

// class PaymentConfirmationScreen extends StatefulWidget {
//   const PaymentConfirmationScreen({super.key});

//   @override
//   State<PaymentConfirmationScreen> createState() =>
//       _PaymentConfirmationScreenState();
// }

// class _PaymentConfirmationScreenState extends State<PaymentConfirmationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,

//         title: Text(
//           'Payment confirmation',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               // border: Border.all(width: 50),
//               // borderRadius: BorderRadius.circular(34),
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(2),
//               border: Border.all(color: Colors.grey.shade200),
//             ),
//             child: Text('Official Receipt'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:trace_app/screens/uuid_screen.dart';
// import 'package:trace_app/screens/source_verification_screen.dart';
// import 'package:trace_app/screens/commodity_details_screen.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  const PaymentConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.more_vert_outlined),
          ),
        ],
        title: Text(
          'Payment confirmation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        // color: Colors.grey,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 15, color: Colors.grey.shade200),
        ),

        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Official Receipt',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.deepOrangeAccent,
                    height: 2,
                  ),
                ),
              ),
              Divider(radius: BorderRadius.all(Radius.circular(33))),
              Text('Receipt # '),
              Text(
                'TX-${generatedCustomID()}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('Date:'),
              Text('...'),
              // Text(organizationName, style: const TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text('Entity'),
              Text('...'),

              SizedBox(height: 20),
              Text('Shipment ID'),
              Text('...'),
              SizedBox(height: 20),

              Text('Commodity'),
              Text('...'),
              SizedBox(height: 20),

              Text('Quantity'),
              Text('...'),
              SizedBox(height: 20),

              Text('Tax rate'),
              Text('5%'),
              SizedBox(height: 20),

              Divider(),
              SizedBox(height: 20),

              Text(
                'Total paid',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff888888),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
