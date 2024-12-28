import 'package:admintemanjalan/screens/destinasi.dart';
import 'package:admintemanjalan/screens/klaimopentrip.dart';
import 'package:admintemanjalan/screens/login.dart';
import 'package:admintemanjalan/utilities/range.dart';
import 'package:flutter/material.dart';

class SidebarScreen extends StatefulWidget {
  const SidebarScreen({super.key, required this.lastEmail});
  final String lastEmail;

  @override
  State<SidebarScreen> createState() => _SidebarScreenState();
}

class _SidebarScreenState extends State<SidebarScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  int isActive = 1;
  bool isProcess = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: sizeMd),
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.stars),
              title: const Text('Destinasi'),
              onTap: () {
                setState(() {
                  isActive = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.stars),
              title: const Text('Klaim'),
              onTap: () {
                setState(() {
                  isActive = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.stars),
              title: const Text('Pengguna'),
              onTap: () {
                setState(() {
                  isActive = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.stars),
              title: const Text('Panduan'),
              onTap: () {
                setState(() {
                  isActive = 4;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.stars),
              title: const Text('Keluar'),
              onTap: () async {
                // setState(() {
                //   isActive = 5;
                // });
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
                await Future.delayed(const Duration(seconds: 1));
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen(lastEmail: widget.lastEmail)),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
      body: isActive == 1
          ? DestinasiScreen(lastEmail: widget.lastEmail)
          : isActive == 2
              ? KlaimOpenTripScreen(lastEmail: widget.lastEmail)
              : Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: sizeMd, vertical: sizeSm),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: const Column(
                    children: <Widget>[
                      Text(
                        'This menu is under reconstruction',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Josefin Sans',
                          fontSize: sizeXl,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
