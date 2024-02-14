import 'dart:convert';

import 'package:app/DetailPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Main-Page")),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user['email'];
            final fname = user['name']['first'];
            final lname = user['name']['last'];

            final image = user['picture']['thumbnail'];
            final country = user['location']['country'];
            final gender = user['gender'];
            final phone = user['phone'];
            final images = user['picture']['large'];

            return ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    image,
                    height: 250,
                  )),
              title: Text(fname.toString()),
              subtitle: Text(email),
              trailing: Text(country.toString()),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailPage(
                        email: email,
                        fname: fname,
                        lname: lname.toString(),
                        images: images,
                        gender: gender,
                        phone: phone,
                        country: country)));
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUser,
        child: Icon(Icons.data_usage_outlined),
      ),
    );
  }

  Future<void> fetchUser() async {
    print("fetchuser called");
    // const url = "https://randomuser.me/api/?results=100";

    final response =
        await http.get(Uri.parse("https://randomuser.me/api/?results=100"));
    //final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    // setState(() {
    //   users = json["results"];
    // });
    print("fetch user completed");
  }
}
