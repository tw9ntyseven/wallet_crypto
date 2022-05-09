import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

import 'package:wallet_fltr/screens/coin-view.dart';
import 'package:wallet_fltr/screens/notification.dart';
import 'package:wallet_fltr/screens/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _cryptoList = [];
  final _saved = Set<Map>();
  final _boldStyle = new TextStyle(fontWeight: FontWeight.bold);
  bool _loading = false;
  final List<MaterialColor> _colors = [
    Colors.blue,
    Colors.indigo,
    Colors.lime,
    Colors.teal,
    Colors.cyan
  ];

  // Function getting from API crypto DATA
  Future<void> getCryptoPrices() async {
    List cryptoDatas = [];
    String _apiURL =
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?id=1,2,3,4,5,6,7,8,9,10";
    setState(() {
      this._loading = true;
    });
    http.Response response = await http.get(Uri.parse(_apiURL),
        headers: {"X-CMC_PRO_API_KEY": "97c1020e-854b-4367-a2cd-84546155371e"});

    Map<String, dynamic> responseJSON = json.decode(response.body);
    if (responseJSON["status"]["error_code"] == 0) {
      for (int i = 1; i <= responseJSON["data"].length; i++) {
        cryptoDatas.add(responseJSON["data"][i.toString()]);
      }
    }
    print(cryptoDatas);

    setState(() {
      this._cryptoList = cryptoDatas;
      this._loading = false;
    });
    return;
  }

// Function for taking and modifing crypto price
  String cryptoPrice(Map crypto) {
    int decimals = 2;
    num fac = pow(10, decimals);
    double d = (crypto['quote']['USD']['price']);
    return "\$" + (d = (d * fac).round() / fac).toString();
  }

  @override
  void initState() {
    super.initState();
    getCryptoPrices();
  }

// Loading view
  CircleAvatar _getLeadingWidget(String name, MaterialColor color) {
    return new CircleAvatar(
      backgroundColor: color,
      child: new Text(name[0]),
    );
  }

//widget for display crypto
  Widget _buildRow(Map crypto, MaterialColor color) {
    final bool favourited = _saved.contains(crypto);
    void _fav() {
      setState(() {
        if (favourited) {
          _saved.remove(crypto);
        } else {
          _saved.add(crypto);
        }
      });
    }

    return coinCard(
        color,
        crypto['symbol'],
        "",
        cryptoPrice(crypto),
        crypto['name'],
        "https://s2.coinmarketcap.com/static/img/coins/64x64/${crypto['id']}.png",
        context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Profile()));
              },
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('lib/assets/images/avatar.jpg'),
              ),
            ),
            Text(
              "Home",
              style: TextStyle(color: Colors.black),
            ),
            IconButton(
              icon: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Notif()));
              },
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _cryptoList.length,
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (context, i) {
                      final index = i;
                      print(index);
                      final MaterialColor color =
                          _colors[index % _colors.length];
                      return _buildRow(_cryptoList[index], color);
                    }),
              ),
            ),
            Container(
              height: 70,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    peopleItem(
                        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80"),
                    peopleItem(
                        "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                    peopleItem(
                        "https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                    peopleItem(
                        "https://images.unsplash.com/photo-1488161628813-04466f872be2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80"),
                    peopleItem(
                        "https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"),
                    peopleItem(
                        "https://images.unsplash.com/photo-1533227268428-f9ed0900fb3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=971&q=80"),
                    peopleItem(
                        "https://images.unsplash.com/photo-1464746133101-a2c3f88e0dd9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1143&q=80"),
                  ],
                ),
              ),
            ),
            Container(
              height: 300,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15.0, 20.0, 10.0, 0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    newsCard(
                        "https://images.unsplash.com/photo-1517586979036-b7d1e86b3345?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80",
                        "6K",
                        "688",
                        "Blockchain Life 2022",
                        "At the end of October, host the seventh Blockchain..."),
                    Padding(padding: EdgeInsets.only(right: 15)),
                    newsCard(
                        "https://images.unsplash.com/photo-1484353371297-d8cfd2895020?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1179&q=80",
                        "12K",
                        "388",
                        "New York Crypto Life 2022",
                        "At the end of October, host the seventh Blockchain..."),
                    Padding(padding: EdgeInsets.only(right: 15)),
                    newsCard(
                        "https://images.unsplash.com/photo-1605792657660-596af9009e82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1102&q=80",
                        "111K",
                        "86K",
                        "Crypto Coin 2022",
                        "At the end of October, host the seventh Blockchain..."),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget coinCard(_color, String _coinName, String _coinUpd, String _coinPrice,
    String _coinFullName, String _imageCoin, context) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0),
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new CoinView(
                      datas: [
                        0.0,
                        1.0,
                        1.5,
                        2.0,
                        0.0,
                        0.0,
                        -0.5,
                        -1.0,
                        -0.5,
                        0.0,
                        0.0
                      ],
                      coinName: _coinName,
                      coinFullName: _coinFullName,
                      coinCost: _coinPrice,
                    )));
      },
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _coinName,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        _coinUpd,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 7)),
                  Row(
                    children: [
                      Text(
                        _coinPrice,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    _imageCoin,
                    height: 20,
                    width: 20,
                  ),
                  // https://s2.coinmarketcap.com/static/img/coins/64x64/1.png
                  Padding(padding: EdgeInsets.only(right: 8)),
                  Text(_coinFullName),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget peopleItem(String _image) {
  return Container(
    width: 70,
    height: 70,
    child: Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(_image),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.pink[100],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget newsCard(String _imageCard, String _review, String _favorite,
    String _titleCard, String _subtitleCard) {
  return InkWell(
    child: Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(_imageCard),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.white,
                ),
                Padding(padding: EdgeInsets.only(right: 5)),
                Text(
                  _review,
                  style: TextStyle(color: Colors.white),
                ),
                Padding(padding: EdgeInsets.only(right: 10)),
                Icon(
                  Icons.favorite_outline,
                  color: Colors.white,
                ),
                Padding(padding: EdgeInsets.only(right: 5)),
                Text(
                  _favorite,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_titleCard,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(_subtitleCard, style: TextStyle(color: Colors.grey[300])),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
