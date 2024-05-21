import 'package:flutter/material.dart';
import 'package:legitcheck/views/claim_ownership.dart';

class ListOfOwnersDetailProduct extends StatelessWidget {
  final double height;
  final double width;
  final List<Map<String, String>> owners;

  ListOfOwnersDetailProduct({
    required this.height,
    required this.width,
    required this.owners,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(70, 158, 158, 158),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: ListView.builder(
        itemCount: owners.length,
        itemBuilder: (context, index) {
          final owner = owners[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            title: Text(
              owner['title']!,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            subtitle: Text(
              owner['email']!,
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 225, 225, 225),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ResultQrButton extends StatelessWidget {
  final double height;
  final double width;
  final String dataDecrypted;

  ResultQrButton(
      {required this.height, required this.width, required this.dataDecrypted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ClaimOwnershipPage(dataDecrypted),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 18),
            minimumSize: Size(width * 0.5, height),
            backgroundColor: Colors.black,
            side: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: Text(
            'Claim Now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
