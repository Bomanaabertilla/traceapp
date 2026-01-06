import 'package:flutter/material.dart';
import 'package:trace_app/image_field_screen.dart';
import 'package:trace_app/models/source_tax_payment_model.dart';
// import 'source_verification_screen.dart';

class CommodityDetailsScreen extends StatefulWidget {
  final String organizationName;

  const CommodityDetailsScreen({super.key, required this.organizationName});

  @override
  State<CommodityDetailsScreen> createState() => _CommodityDetailsScreenState();
}

final List<String> documentTypes = [
  'Waybill',
  'Tax receipt',
  'Customs receipt',
  'Freight invoice',
];

class _CommodityDetailsScreenState extends State<CommodityDetailsScreen> {
  String? selectCommodityType;
  String? selectPurpose;
  String? selectVehicle;
  String? selectDestination;

  String? selectType;

  final TextEditingController quantityController = TextEditingController();
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController licensePlateController = TextEditingController();
  // bool isChecked = false;
  List<bool> isCheckedList = [false, false, false, false];

  double calculateTax() {
    final quantityText = quantityController.text.trim();
    if (quantityText.isEmpty) return 0.0;

    final quantity = double.tryParse(quantityText) ?? 0.0;
    return quantity * 12.5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Commodity details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),

      // body: Text('GreenTech Agro Ltd.'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                widget.organizationName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 23,
                ),
              ),

              SizedBox(height: 50),
              // Text(entry, style: const TextStyle(fontSize: 18)),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: DropdownMenu<String>(
                  initialSelection: selectCommodityType,
                  onSelected: (String? newValue) {
                    setState(() {
                      selectCommodityType = newValue;
                    });
                  },
                  label: const Text('Commodity type'),
                  hintText: 'Select an option',
                  // helperText: 'dddf',
                  width: MediaQuery.sizeOf(context).width,
                  inputDecorationTheme: const InputDecorationTheme(
                    border: OutlineInputBorder(),
                  ),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 'Shea nuts', label: 'Shea nuts'),
                    DropdownMenuEntry(value: 'Millet', label: 'Millet'),
                    DropdownMenuEntry(value: 'Cashew nuts', label: 'Cashew nuts'),
                  ],
                ),
              ),

              // TextFormField(autocorrect: true),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: quantityController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Quantity in MT',
                    labelText: 'Quantity (MT)',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(1),
                child: DropdownMenu<String>(
                  hintText: 'Select an option',

                  initialSelection: selectPurpose,
                  onSelected: (String? newValue) {
                    setState(() {
                      selectPurpose = newValue;
                    });
                  },
                  label: const Text('Purpose'),

                  width: MediaQuery.sizeOf(context).width,
                  inputDecorationTheme: const InputDecorationTheme(
                    border: OutlineInputBorder(),
                  ),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 'Export', label: 'Export'),
                    DropdownMenuEntry(value: 'Inport', label: 'Inport'),
                  ],
                ),
              ),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(1),
                child: DropdownMenu<String>(
                  hintText: 'Destination',
                  // initialSelection: selectType,
                  onSelected: (String? newValue) {
                    setState(() {
                      selectDestination = newValue;
                    });
                  },
                  label: const Text('Destination'),
                  width: MediaQuery.sizeOf(context).width,
                  inputDecorationTheme: const InputDecorationTheme(
                    border: OutlineInputBorder(),
                  ),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(
                      value: 'Eastern Port Terminal',
                      label: 'Eastern Port Terminal',
                    ),
                    DropdownMenuEntry(
                      value: 'Western Port Terminal',
                      label: 'Western Port Terminal',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(1),
                child: DropdownMenu<String>(
                  hintText: 'Vehicle',
                  initialSelection: selectType,
                  onSelected: (String? newValue) {
                    setState(() {
                      selectType = newValue;
                    });
                  },
                  label: const Text('Type of vehicle'),
                  width: MediaQuery.sizeOf(context).width,
                  inputDecorationTheme: const InputDecorationTheme(
                    border: OutlineInputBorder(),
                  ),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(
                      value: 'm truck',
                      label: 'Medium duty truck',
                    ),
                    DropdownMenuEntry(
                      value: 's truck',
                      label: 'Small Port Terminal',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Driver full name',
                    labelText: 'Driver name',
                  ),
                ),
              ),
              // SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'License plate number',
                    labelText: 'License plate number',
                  ),
                ),
              ),

              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.only(left: 18 - 18),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select all available documentation',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),

              ListTile(
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
                leading: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.deepOrangeAccent,
                  value: isCheckedList[0],
                  onChanged: (bool? newValue) {
                    setState(() {
                      isCheckedList[0] = newValue ?? false;
                    });
                  },
                ),
                title: Text('Waybill'),
              ),

              ListTile(
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
                leading: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.deepOrangeAccent,
                  value: isCheckedList[1],
                  onChanged: (bool? newValue) {
                    setState(() {
                      isCheckedList[1] = newValue ?? false;
                    });
                  },
                ),
                title: Text('Tax receipt'),
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
                leading: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.deepOrangeAccent,
                  value: isCheckedList[2],
                  onChanged: (bool? newValue) {
                    setState(() {
                      isCheckedList[2] = newValue ?? false;
                    });
                  },
                ),
                title: Text('Customs receipt'),
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
                leading: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.deepOrangeAccent,
                  value: isCheckedList[3],
                  onChanged: (bool? newValue) {
                    setState(() {
                      isCheckedList[3] = newValue ?? false;
                    });
                  },
                ),
                title: Text('Freight invoice'),
              ),

              // SizedBox(height: 30),
              if (isCheckedList[0])
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        'Waybill',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      ImageFieldScreen(),
                    ],
                  ),
                ),

              // SizedBox(height: 20),
              if (isCheckedList[1])
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        'Tax receipt',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      ImageFieldScreen(),
                    ],
                  ),
                ),

              // SizedBox(height: 20),
              if (isCheckedList[2])
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        'Customs receipt',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      ImageFieldScreen(),
                    ],
                  ),
                ),

              // SizedBox(height: 20),
              if (isCheckedList[3])
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        'Freight invoce',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      ImageFieldScreen(),
                    ],
                  ),
                ),

              // SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
                  ),
                  fixedSize: Size(290, 50),
                ),
                onPressed: () {
                  final double calculatedTax = calculateTax();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return SourceTaxPaymentScreen(
                          commodity: selectCommodityType ?? 'Not available',
                          destination: selectDestination ?? 'Not avialable',
                          purpose: selectPurpose ?? 'Not available',
                          quantity: quantityController.text.isEmpty
                              ? '0.00 kg'
                              : '${quantityController.text} kg',
                          taxAmount: calculatedTax,
                          organizationName: widget.organizationName,
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  'Continue',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
