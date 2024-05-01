import 'package:flutter/material.dart';

List<Map<String, String>> owners = [
  {'title': 'First Owner', 'email': 'First@gmail.com'},
  {'title': 'Second Owner', 'email': 'Second@gmail.com'},
  {'title': 'Current Owner', 'email': 'Current@gmail.com'},
];

class ListOfOwnersDetailProduct extends StatelessWidget {
  final double height;
  final double width;

  ListOfOwnersDetailProduct({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(70, 158, 158, 158),
        border: Border.all(
          color: Colors.black,
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

  ResultQrButton({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // height: height * 0.1,
      child: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 18),
            minimumSize: Size(width * 0.5, height * 1),
            backgroundColor: Colors.black,
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
