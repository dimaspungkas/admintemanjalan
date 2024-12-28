import 'package:admintemanjalan/screens/destinasi.dart';
import 'package:admintemanjalan/screens/footer.dart';
import 'package:flutter/material.dart';
import 'package:admintemanjalan/utilities/range.dart';
import 'package:admintemanjalan/utilities/colors.dart';

class DestinasiDetailScreen extends StatefulWidget {
  const DestinasiDetailScreen({super.key, required this.lastEmail});
  final String lastEmail;
  @override
  State<DestinasiDetailScreen> createState() => _DestinasiDetailScreenState();
}

class _DestinasiDetailScreenState extends State<DestinasiDetailScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final myEmailController = TextEditingController();

  bool isProcess = false;
  bool isActive = true;

  @override
  void initState() {
    super.initState();
    if (widget.lastEmail != '') {
      myEmailController.text = widget.lastEmail;
    }
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
            // banner
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
                          'Atur seluruh data Destinasi yang bermitra dengan Teman Jalan',
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
                          'Detail Mitra Destinasi',
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
            // button list
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DestinasiScreen(
                              lastEmail: myEmailController.text)),
                    );
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
                        'List',
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
            const SizedBox(height: sizeSm),
            Container(
              height: 210,
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey.shade100,
                    Colors.grey.shade300,
                    Colors.grey.shade400,
                    Colors.grey.shade500,
                  ],
                  stops: const [0.1, 0.3, 0.6, 0.8],
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0.0),
                      backgroundColor: Colors.white),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01),
                    width: 180,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.05, //55,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Unggah Gambar*',
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 0.2,
                          fontSize: sizeSm * 1.2,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Urbanist',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
