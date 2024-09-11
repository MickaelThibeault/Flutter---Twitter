
import 'package:flutter/material.dart';
import 'package:twitter/twitter-card.dart';
import 'footer.dart';
import 'header.dart';
import 'model/tweet.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TweetListPage extends StatefulWidget {

  @override
  State<TweetListPage> createState() => _TweetListPageState();
}

class _TweetListPageState extends State<TweetListPage> {
  List<Tweet> tweets = [];

  @override
  void initState() {
    super.initState();
    callApi();
  }

  void callApi() async {
    setState(() {
      tweets.clear();
    });

    var response = await http.get(Uri.parse('https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json'));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List;
      setState(() {
        tweets = jsonResponse.map((tweet) => Tweet.fromJson(tweet)).toList();
      });
    } else {
      throw Exception('Failed to load tweets');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          color: Colors.blue,
          alignment: Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
                child: Text("Twitter", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: ListView.builder(
                    itemCount: tweets.length,
                    itemBuilder: (context, index) {
                      return TweetCard(tweets[index]);
                    },
              ),
            ),
            )],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
