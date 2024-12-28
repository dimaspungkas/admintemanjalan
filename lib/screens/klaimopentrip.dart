import 'package:admintemanjalan/screens/footer.dart';
import 'package:flutter/material.dart';
import 'package:admintemanjalan/utilities/range.dart';
import 'package:admintemanjalan/utilities/colors.dart';
import 'package:intl/intl.dart';

class KlaimOpenTripScreen extends StatefulWidget {
  const KlaimOpenTripScreen({super.key, required this.lastEmail});
  final String lastEmail;
  @override
  State<KlaimOpenTripScreen> createState() => _KlaimOpenTripScreenState();
}

class _KlaimOpenTripScreenState extends State<KlaimOpenTripScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final myEmailController = TextEditingController();
  final namaDestinasiController = TextEditingController();
  final kategoriController = TextEditingController();
  final kabKotaController = TextEditingController();
  final pengelolaController = TextEditingController();
  final emailController = TextEditingController();
  final noTelpController = TextEditingController();
  final detailController = TextEditingController();
  final alamatController = TextEditingController();

  bool isProcess = false;
  bool isDone = false;

  List<Map<dynamic, dynamic>> klaimList = [
    {
      'namaTrip': 'Naik Ciremai',
      'nominal': 2000000,
      'statusTrip': "Open", // 1 Open 0 Close
      'tipeKlaim': "Maksimal 50%"
    },
    {
      'namaTrip': 'Naik Ciremai',
      'nominal': 2000000,
      'statusTrip': "Open", // 1 Open 0 Close
      'tipeKlaim': "Maksimal 50%"
    },
    {
      'namaTrip': 'Naik Ciremai',
      'nominal': 2000000,
      'statusTrip': "Open", // 1 Open 0 Close
      'tipeKlaim': "Maksimal 50%"
    },
    {
      'namaTrip': 'Naik Ciremai',
      'nominal': 2000000,
      'statusTrip': "Open", // 1 Open 0 Close
      'tipeKlaim': "Maksimal 50%"
    },
    {
      'namaTrip': 'Naik Ciremai',
      'nominal': 2000000,
      'statusTrip': "Open", // 1 Open 0 Close
      'tipeKlaim': "Maksimal 50%"
    },
    {
      'namaTrip': 'Naik Ciremai',
      'nominal': 2000000,
      'statusTrip': "Open", // 1 Open 0 Close
      'tipeKlaim': "Maksimal 50%"
    },
  ];

  @override
  void initState() {
    super.initState();
    if (widget.lastEmail != '') {
      myEmailController.text = widget.lastEmail;
    }
  }

  String formatCurrency(double amount) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id_ID', // Indonesian locale
      symbol: 'Rp', // Currency symbol
      decimalDigits: 2, // No decimal points for Rupiah
    );
    return currencyFormatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: sizeSm),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: sizeLg, vertical: sizeSm),
                height: sizeXxl * 3,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomLeft,
                decoration: const BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(28),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(sizeSm),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    verticalDirection: VerticalDirection.up,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Approval Klaim Open Trip',
                          style: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'Josefin Sans',
                            fontSize: sizeSm,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'List Klaim Open Trip',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Josefin Sans',
                            fontSize: sizeXl,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: sizeSm),
            Container(
              width: sizeXxl * 6,
              padding: const EdgeInsets.symmetric(horizontal: sizeMd),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        // if (validateAndSave()) {
                        setState(() {
                          isDone = false;
                        });

                        //   loginAction();
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0.0),
                        backgroundColor: !isDone ? activeColor : Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100.0),
                            topLeft: Radius.circular(100.0),
                          ),
                        ),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: SizedBox(
                        width: sizeXxl * 2.5,
                        height: sizeXl, //55,
                        child: Align(
                          child: Text(
                            !isDone
                                ? '\u2713 Outstanding Claim'
                                : 'Outstanding Claim',
                            style: const TextStyle(
                              color: Colors.black,
                              letterSpacing: 0.2,
                              fontSize: sizeSm,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        // if (validateAndSave()) {
                        setState(() {
                          isDone = true;
                        });

                        //   loginAction();
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0.0),
                        backgroundColor: isDone ? activeColor : Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100.0),
                            bottomRight: Radius.circular(100.0),
                          ),
                        ),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                      child: SizedBox(
                        width: sizeXxl * 2.5,
                        height: sizeXl, //55,
                        child: Align(
                          child: Text(
                            isDone ? '\u2713 Done Claim' : 'Done Claim',
                            style: const TextStyle(
                              color: Colors.black,
                              letterSpacing: 0.2,
                              fontSize: sizeSm,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: sizeSm),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 350,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: klaimList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: sizeSm),
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: greyText)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  klaimList[index]['namaTrip']!,
                                  style: const TextStyle(
                                      fontSize: sizeLg,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Title Small/Font'),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  formatCurrency(klaimList[index]['nominal']!),
                                  style: const TextStyle(
                                      fontSize: sizeMd,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Title Small/Font'),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "Status Trip",
                                      style: TextStyle(
                                          fontSize: sizeSm,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Title Small/Font'),
                                    ),
                                    const SizedBox(width: sizeXl * 2.5),
                                    const Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: sizeSm,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Title Small/Font'),
                                    ),
                                    const SizedBox(width: sizeSm),
                                    Text(
                                      klaimList[index]['statusTrip']!,
                                      style: TextStyle(
                                          color: klaimList[index]
                                                      ['statusTrip'] ==
                                                  "Open"
                                              ? Colors.green
                                              : greyText,
                                          fontSize: sizeSm,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Title Small/Font'),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "Tipe Klaim",
                                      style: TextStyle(
                                          fontSize: sizeSm,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Title Small/Font'),
                                    ),
                                    const SizedBox(width: sizeXl * 2.5),
                                    const Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: sizeSm,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Title Small/Font'),
                                    ),
                                    const SizedBox(width: sizeSm),
                                    Text(
                                      klaimList[index]['tipeKlaim']!,
                                      style: const TextStyle(
                                          fontSize: sizeSm,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Title Small/Font'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: sizeXxl),
                              child: ElevatedButton(
                                onPressed: () {
                                  // setState(() {
                                  //   isEdit = true;
                                  // });
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0.0),
                                  backgroundColor: primaryBlue,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  side: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                                child: const SizedBox(
                                  width: sizeXxl * 5.5,
                                  height: sizeXl, //55,
                                  child: Align(
                                    child: Text(
                                      'Apply Claim',
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.2,
                                        fontSize: sizeMd,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Urbanist',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
