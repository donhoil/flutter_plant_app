import 'package:flutter/material.dart';
import 'package:quotesapp/screens/second_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = '';
  String author = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(quote, style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "- $author",
                    style: TextStyle(fontSize: 18),
                  )),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = Uri.parse(
                    'https://goquotes-api.herokuapp.com/api/v1/random?count=1');
                var response = await http.get(url);

                var data = jsonDecode(response.body);

                quote = data['quotes'][0]['text'];
                author = data['quotes'][0]['author'];

                setState(() {});
              },
              child: Text("Get Quote!"),
            ),
          ],
        ),
      ),
    );
  }
}
