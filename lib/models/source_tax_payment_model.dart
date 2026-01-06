import 'package:flutter/material.dart';
import 'package:trace_app/screens/payment_processing_screen.dart';
import 'package:trace_app/screens/uuid_screen.dart';

class SourceTaxPaymentScreen extends StatefulWidget {
  final String commodity;
  final String quantity;
  final String purpose;
  final String destination;
  final double taxAmount;
  final String organizationName;

  const SourceTaxPaymentScreen({
    super.key,
    required this.commodity,
    required this.destination,
    required this.purpose,
    required this.quantity,
    required this.taxAmount,
    required this.organizationName,
  });

  @override
  State<SourceTaxPaymentScreen> createState() => _SourceTaxPaymentScreenState();
}

class _SourceTaxPaymentScreenState extends State<SourceTaxPaymentScreen> {
  int? selectedPayment;

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
          'Source tax payment',
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
              'Commodity tax calculation',
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

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                // height: 100,
                // margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 214, 205, 205),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'Receipt #: TX-${generatedCustomID()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),
            Text(
              'Pay With',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            RadioListTile<int>(
              value: 0,
              // ignore: deprecated_member_use
              groupValue: selectedPayment,
              activeColor: Colors.deepOrangeAccent,
              // ignore: deprecated_member_use
              onChanged: (value) => setState(() => selectedPayment = value),
              title: Text('Mobile money'),
            ),

            RadioListTile<int>(
              value: 1,
              // ignore: deprecated_member_use
              groupValue: selectedPayment,
              activeColor: Colors.deepOrangeAccent,
              // ignore: deprecated_member_use
              onChanged: (value) => setState(() => selectedPayment = value),
              title: Text('Bank transfer'),
            ),
            const SizedBox(height: 50),

            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 56,
              child: ElevatedButton(
                onPressed: selectedPayment == 0
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                PaymentProcessingScreen(
                                  // organizationName: widget.organizationName,
                                  commodity: widget.commodity,
                                  destination: widget.destination,
                                  purpose: widget.purpose,
                                  quantity: widget.quantity,
                                  taxAmount: widget.taxAmount,
                                  paymentMethod: 'Mobile money',
                                  // paymentMethod:
                                ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Proceed to payment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
