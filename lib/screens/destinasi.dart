import 'package:admintemanjalan/screens/footer.dart';
import 'package:flutter/material.dart';
import 'package:admintemanjalan/utilities/range.dart';
import 'package:admintemanjalan/utilities/colors.dart';

class DestinasiScreen extends StatefulWidget {
  const DestinasiScreen({super.key, required this.lastEmail});
  final String lastEmail;
  @override
  State<DestinasiScreen> createState() => _DestinasiScreenState();
}

class _DestinasiScreenState extends State<DestinasiScreen> {
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
  bool isActive = false;
  bool isEdit = false;

  List<Map<dynamic, dynamic>> destinationList = [
    {
      'img': 'assets/images/Default_Image.png',
      'nama_destinasi': 'Ancol',
      'kategori': 'Pantai',
      'kota': 'Jakarta Utara',
      'pengelola': 'PT Pembangunan Jaya Ancol Tbk',
      'alamat':
          'Ecovention Building - Jl. Lodan Timur No.7, Ancol, Kec. Pademangan, Kota Jakarta Utara, Daerah Khusus Ibukota Jakarta 14430'
    },
    {
      'img': 'assets/images/Default_Image.png',
      'nama_destinasi': 'Gunung Gede Pangrango',
      'kategori': 'Gunung',
      'kota': 'Bogor',
      'pengelola':
          'Direktorat Jenderal Konservasi Sumber Daya Alam dan Ekosistem, Kementerian Lingkungan Hidup dan Kehutanan',
      'alamat': 'Taman Nasional Gunung Gede Pangrango, Jawa Barat'
    },
    {
      'img': 'assets/images/Default_Image.png',
      'nama_destinasi': 'Gunung Gede Pangrango',
      'kategori': 'Gunung',
      'kota': 'Bogor',
      'pengelola':
          'Direktorat Jenderal Konservasi Sumber Daya Alam dan Ekosistem, Kementerian Lingkungan Hidup dan Kehutanan',
      'alamat': 'Taman Nasional Gunung Gede Pangrango, Jawa Barat'
    },
    {
      'img': 'assets/images/Default_Image.png',
      'nama_destinasi': 'Gunung Gede Pangrango',
      'kategori': 'Gunung',
      'kota': 'Bogor',
      'pengelola':
          'Direktorat Jenderal Konservasi Sumber Daya Alam dan Ekosistem, Kementerian Lingkungan Hidup dan Kehutanan',
      'alamat': 'Taman Nasional Gunung Gede Pangrango, Jawa Barat'
    },
    {
      'img': 'assets/images/Default_Image.png',
      'nama_destinasi': 'Gunung Gede Pangrango',
      'kategori': 'Gunung',
      'kota': 'Bogor',
      'pengelola':
          'Direktorat Jenderal Konservasi Sumber Daya Alam dan Ekosistem, Kementerian Lingkungan Hidup dan Kehutanan',
      'alamat': 'Taman Nasional Gunung Gede Pangrango, Jawa Barat'
    },
  ];

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
      body: !isEdit
          ? SingleChildScrollView(
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
                                'List Mitra Destinasi',
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
                    width: sizeXxl * 5,
                    padding: const EdgeInsets.symmetric(horizontal: sizeMd),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () {
                              // if (validateAndSave()) {
                              setState(() {
                                isActive = true;
                              });

                              //   loginAction();
                              // }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0.0),
                              backgroundColor:
                                  isActive ? activeColor : Colors.white,
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
                                  isActive ? '\u2713 Active' : 'Active',
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
                                isActive = false;
                              });

                              //   loginAction();
                              // }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0.0),
                              backgroundColor:
                                  !isActive ? activeColor : Colors.white,
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
                                  !isActive ? '\u2713 Inactive' : 'Inactive',
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isEdit = true;
                          });
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
                              'Tambah',
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
                    padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 350,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: destinationList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: sizeSm),
                          width: MediaQuery.of(context).size.width,
                          height: 110,
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 1, color: greyText)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(0.0),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        destinationList[index]['img']!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: sizeMd),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      destinationList[index]['nama_destinasi']!,
                                      style: const TextStyle(
                                          fontSize: sizeLg,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Title Small/Font'),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          destinationList[index]['kategori']!,
                                          style: const TextStyle(
                                              fontSize: sizeSm,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Title Small/Font'),
                                        ),
                                        const SizedBox(width: 4),
                                        const Icon(
                                          Icons.circle,
                                          size: sizeSm / 4,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          destinationList[index]['kota']!,
                                          style: const TextStyle(
                                              fontSize: sizeSm,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Title Small/Font'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      destinationList[index]['pengelola']!,
                                      style: const TextStyle(
                                          fontSize: sizeSm,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Title Small/Font'),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      destinationList[index]['alamat']!,
                                      style: const TextStyle(
                                          fontSize: sizeSm,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Title Small/Font'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isEdit = false;
                          });
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                    child: Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
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
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.01),
                            width: 180,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            height:
                                MediaQuery.of(context).size.height * 0.05, //55,
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
                  ),
                  const SizedBox(height: sizeSm),
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: sizeXxl),
                    minTileHeight: sizeSm,
                    titleAlignment: ListTileTitleAlignment.center,
                    horizontalTitleGap: 4,
                    title: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Inactive',
                            style: TextStyle(
                                fontSize: sizeMd,
                                fontFamily: 'Body/Font Family'),
                          ),
                        ),
                      ],
                    ),
                    leading: Checkbox(
                      value: isActive,
                      onChanged: (bool? value) {
                        setState(() {
                          isActive = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: sizeSm),
                  // Nama Destinasi
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: namaDestinasiController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Arial',
                          fontSize: sizeMd),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54.withOpacity(0.5),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: sizeSm),
                        labelText: 'Nama Destinasi*',
                        labelStyle: const TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Body/Font Family',
                            fontSize: sizeMd),
                      ),
                    ),
                  ),
                  const SizedBox(height: sizeSm),
                  // Kategori Destinasi
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: kategoriController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Arial',
                          fontSize: sizeMd),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54.withOpacity(0.5),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: sizeSm),
                        labelText: 'Kategori Destinasi*',
                        labelStyle: const TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Body/Font Family',
                            fontSize: sizeMd),
                      ),
                    ),
                  ),
                  const SizedBox(height: sizeSm),
                  // Kabupaten / Kota
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: kabKotaController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Arial',
                          fontSize: sizeMd),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54.withOpacity(0.5),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: sizeSm),
                        labelText: 'Kabupaten / Kota*',
                        labelStyle: const TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Body/Font Family',
                            fontSize: sizeMd),
                      ),
                    ),
                  ),
                  const SizedBox(height: sizeSm),
                  // Pengelola Destinasi
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: pengelolaController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Arial',
                          fontSize: sizeMd),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54.withOpacity(0.5),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: sizeSm),
                        labelText: 'Pengelola Destinasi*',
                        labelStyle: const TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Body/Font Family',
                            fontSize: sizeMd),
                      ),
                    ),
                  ),
                  const SizedBox(height: sizeSm),
                  // Email Pengelola Destinasi
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Arial',
                          fontSize: sizeMd),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54.withOpacity(0.5),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: sizeSm),
                        labelText: 'Email Pengelola Destinasi*',
                        labelStyle: const TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Body/Font Family',
                            fontSize: sizeMd),
                      ),
                    ),
                  ),
                  const SizedBox(height: sizeSm),
                  // No. Telp Destinasi
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: noTelpController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Arial',
                          fontSize: sizeMd),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54.withOpacity(0.5),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: sizeSm),
                        labelText: 'No. Telp Destinasi*',
                        labelStyle: const TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Body/Font Family',
                            fontSize: sizeMd),
                      ),
                    ),
                  ),
                  const SizedBox(height: sizeSm),
                  // Detail Destinasi
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: namaDestinasiController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Arial',
                          fontSize: sizeMd),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54.withOpacity(0.5),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: sizeSm),
                        labelText: 'Detail Destinasi',
                        labelStyle: const TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Body/Font Family',
                            fontSize: sizeMd),
                      ),
                    ),
                  ),
                  const SizedBox(height: sizeSm),
                  // Alamat Destinasi
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: alamatController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Arial',
                          fontSize: sizeMd),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white54.withOpacity(0.5),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: sizeSm),
                        labelText: 'Alamat Destinasi*',
                        labelStyle: const TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Body/Font Family',
                            fontSize: sizeMd),
                      ),
                    ),
                  ),
                  const SizedBox(height: sizeSm),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: sizeXxl),
                      child: ElevatedButton(
                        onPressed: () {
                          // setState(() {
                          //   isEdit = false;
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
                          width: sizeXxl * 5,
                          height: sizeXl, //55,
                          child: Align(
                            child: Text(
                              'Save',
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
                ],
              ),
            ),
      bottomNavigationBar: const Footer(),
    );
  }
}
