import 'package:admintemanjalan/screens/footer.dart';
import 'package:admintemanjalan/screens/sidebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admintemanjalan/utilities/range.dart';
import 'package:admintemanjalan/utilities/colors.dart';
import 'package:admintemanjalan/utilities/alertmessage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.lastEmail});
  final String lastEmail;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final myEmailController = TextEditingController();
  final myPasswordController = TextEditingController();

  FocusNode nodeEmail = FocusNode();
  FocusNode nodePassword = FocusNode();

  bool hidePassword = true;
  bool isProcess = false;

  @override
  void initState() {
    super.initState();
    if (widget.lastEmail != '') {
      myEmailController.text = widget.lastEmail;
    }
  }

  Future<bool> validateAndSave() async {
    bool valid = false;

    if (myEmailController.text == '' || myEmailController.text.isEmpty) {
      var dialog = const CustomAlertDialog(
          type: 4, title: "Information", message: "Please input your email");
      showDialog(context: context, builder: (BuildContext context) => dialog);
      return false;
    } else if (myPasswordController.text == '' ||
        myPasswordController.text.isEmpty) {
      var dialog = const CustomAlertDialog(
          type: 4, title: "Information", message: "Please input your password");
      showDialog(context: context, builder: (BuildContext context) => dialog);
      return false;
    }
    valid = await _checkDataUsers();
    if (!valid) {
      var dialog = const CustomAlertDialog(
          type: 4, title: "Information", message: "User not found");
      showDialog(context: context, builder: (BuildContext context) => dialog);
    }
    return valid;
  }

  Future<void> loginAction() async {
    try {
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
            builder: (context) => SidebarScreen(
              lastEmail: myEmailController.text,
            ),
          ),
          (route) => false);
    } catch (e) {
      CustomAlertDialog(type: 2, title: "Error", message: e.toString());
    }
  }

  Future<bool> _checkDataUsers() async {
    try {
      List<Map<String, dynamic>> dataList = [];
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      QuerySnapshot querySnapshot = await users.get();
      setState(() {
        dataList = querySnapshot.docs.map((doc) {
          return doc.data() as Map<String, dynamic>;
        }).toList();
      });
      //print(dataList[0].toString());
      bool success = false;
      if (dataList.isNotEmpty) {
        for (int i = 0; i < dataList.length; i++) {
          if (myEmailController.text == dataList[i]['email'].toString() &&
              myPasswordController.text == dataList[i]['password'].toString()) {
            success = true;
          }
        }
      }
      return success;
    } catch (e) {
      var dialog = CustomAlertDialog(
          type: 2, title: "Error", message: "Error fetching data: $e");
      showDialog(context: context, builder: (BuildContext context) => dialog);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Form(
          key: formkey,
          child: Center(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: sizeMd, vertical: sizeXl),
                  height: sizeXxl * 12,
                  width: sizeXxl * 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryBlue,
                      width: 4,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      Image.asset('assets/images/logo.png', fit: BoxFit.cover),
                      Image.asset('assets/images/logo_text.png',
                          fit: BoxFit.cover),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: sizeSm),
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          controller: myEmailController,
                          focusNode: nodeEmail,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Arial',
                              fontSize: sizeMd),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54.withOpacity(0.5),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400), //
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: sizeSm),
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Josefin Sans',
                                fontSize: sizeMd),
                          ),
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(nodePassword);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            final emailRegExp = RegExp(
                              r'^[^@]+@[^@]+\.[^@]+$',
                              caseSensitive: false,
                            );
                            if (!emailRegExp.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: sizeSm),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: sizeSm),
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          controller: myPasswordController,
                          focusNode: nodePassword,
                          obscureText: hidePassword,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Arial',
                              fontSize: sizeMd),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54.withOpacity(0.5),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400), //
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: sizeSm),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Josefin Sans',
                                fontSize: sizeMd),
                          ),
                        ),
                      ),
                      const SizedBox(height: sizeSm),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: sizeSm),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (await validateAndSave()) {
                              setState(() {
                                isProcess = true;
                              });

                              loginAction();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0.0),
                              backgroundColor: primaryBlue),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03),
                            width: MediaQuery.of(context).size.width,
                            height:
                                MediaQuery.of(context).size.height * 0.05, //55,
                            child: const Align(
                                child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 0.2,
                                fontSize: sizeMd,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Urbanist',
                              ),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
