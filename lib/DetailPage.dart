// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DetailPage(
      {super.key,
      required this.email,
      required this.fname,
      required this.lname,
      required this.images,
      required this.gender,
      required this.phone,
      required this.country});

  final email;
  final fname;
  final lname;
  final images;
  final gender;
  final phone;
  final country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 253, 253, 253),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text(fname)),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.all(45),
            color: const Color.fromARGB(136, 41, 96, 245),
            child: Center(
              child: CircleAvatar(
                radius: 175,
                backgroundColor: const Color.fromARGB(255, 139, 7, 255),
                child: CircleAvatar(
                    radius: 150, backgroundImage: NetworkImage(images)),
              ),
            ),
          ),
          Text(
            "Full Name:  " + fname + " " + lname,
            style: const TextStyle(fontSize: 23),
          ),
          const SizedBox(
            height: 5,
          ),
          Text("Email:" + email, style: const TextStyle(fontSize: 18)),
          Text("Phone:" + phone, style: const TextStyle(fontSize: 18)),
          Text("Gender:" + gender, style: const TextStyle(fontSize: 18)),
          Text("Country:" + country, style: const TextStyle(fontSize: 19)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.keyboard_backspace),
      ),
    );
  }
}
