import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final appBar = AppBar(
      backgroundColor: Colors.black,
      title: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context, 2);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Row(
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final bodyHeight = mediaQueryHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bodyWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: appBar,
            body: Container(
              height: bodyHeight,
              width: bodyWidth,
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    height: bodyHeight * 0.15 - 24,
                    width: bodyWidth * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: bodyHeight * 0.1,
                          width: bodyWidth * 0.9,
                          child: Center(
                            child: Text(
                              "ABOUT",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: bodyHeight * 0.5,
                    width: bodyWidth * 0.9,
                    child: Text(
                      "LegitCheck adalah solusi inovatif dalam mengatasi masalah produk tiruan. Masalah yang ada adalah peningkatan produk palsu yang sulit dibedakan dari aslinya, merugikan merek dan konsumen. Dalam menanggapi masalah ini, LegitCheck hadir sebagai aplikasi scan QR code dan pembuatan QR code untuk merek atau brand. Aplikasi ini memungkinkan verifikasi keaslian produk melalui pemindaian QR code, memberikan akses langsung kepada konsumen untuk memeriksa produk sebelum pembelian. LegitCheck adalah solusi yang praktis dalam menanggulangi masalah produk tiruan, memberikan solusi yang cepat, mudah, serta andal bagi konsumen untuk memverifikasi keaslian produk, sambil memberikan alat kepada merek untuk melindungi identitas merek dan keaslian produk mereka.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )));
  }
}
