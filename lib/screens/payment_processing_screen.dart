import 'package:flutter/material.dart';
import 'package:trace_app/screens/payment_confirmation_screen.dart';
import 'package:trace_app/screens/uuid_screen.dart';

class PaymentProcessingScreen extends StatefulWidget {
  final String commodity;
  final String quantity;
  final String purpose;
  final String destination;
  final double taxAmount;
  final String paymentMethod;

  const PaymentProcessingScreen({
    super.key,
    required this.commodity,
    required this.destination,
    required this.purpose,
    required this.quantity,
    required this.taxAmount,
    required this.paymentMethod,
  });

  @override
  State<PaymentProcessingScreen> createState() =>
      _PaymentProcessingScreenState();
}

class _PaymentProcessingScreenState extends State<PaymentProcessingScreen> {
  int? selectedPayment = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _sumDetailsRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        title: Text(
          'Payment processing',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mobile Money Payment',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Colors.grey.shade200, width: 15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sumDetailsRow('Commodity:', widget.commodity),
                  _sumDetailsRow('Quantity:', widget.quantity),
                  _sumDetailsRow('Purpose:', widget.purpose),
                  _sumDetailsRow('Destination:', widget.destination),
                  _sumDetailsRow('Tax Rate:', '5%'),
                  const Divider(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total tax due:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'GH ${widget.taxAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // TextField(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Text(
                        'Transaction reference',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      Text(
                        'SRC-TAX-${generatedCustomID()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // TextField(
            //   decoration: InputDecoration(
            //     // label: Text('data'),
            //     labelText: 'MoMo number',
            //     hintText: 'e.g 055303490930',
            //   ),
            // ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'e.g 0507835466',
                      labelText: 'MoMo number',
                    ),
                  ),

                  SizedBox(height: 25),

                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'e.g Transporter ventures',
                      labelText: 'Momo name',
                    ),
                  ),
                  SizedBox(height: 35),

                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()){
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing payment')));
                        // }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return PaymentConfirmationScreen();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Verify payment',
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

// Widget _sumDetailsRow(String label, String value) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 6),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(label, style: const TextStyle(color: Colors.grey)),
//         Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
//       ],
//     ),
//   );
// }
