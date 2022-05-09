import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:wallet_fltr/screens/notification.dart';
import 'package:wallet_fltr/screens/profile.dart';

class CryptoList extends StatefulWidget {
  const CryptoList({Key? key}) : super(key: key);

  @override
  CryptoListState createState() => CryptoListState();
}

class CryptoListState extends State<CryptoList> {
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

  String cryptoPrice(Map crypto) {
    int decimals = 2;
    num fac = pow(10, decimals);
    double d = (crypto['quote']['USD']['price']);
    // print(crypto['quote']['USD']['price']);
    return "\$" + (d = (d * fac).round() / fac).toString();
  }

  CircleAvatar _getLeadingWidget(String name, MaterialColor color) {
    return new CircleAvatar(
      backgroundColor: color,
      child: new Text(name[0]),
    );
  }

  _getMainBody() {
    if (_loading) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return new RefreshIndicator(
        child: _buildCryptoList(),
        onRefresh: getCryptoPrices,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getCryptoPrices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //   title: Text('CryptoList'),
          //   actions: <Widget>[
          //     new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
          //   ],
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
                "Crypto List",
                style: TextStyle(color: Colors.black),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                  onPressed: _pushSaved)
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: _getMainBody());
  }

  //Function for open list of a favorite crypto coins
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (crypto) {
              return new ListTile(
                leading: _getLeadingWidget(crypto['name'], Colors.blue),
                title: Text(crypto['name']),
                subtitle: Text(
                  cryptoPrice(crypto),
                  style: _boldStyle,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    "Favorites Crypto Coin",
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
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildCryptoList() {
    return ListView.builder(
        itemCount: _cryptoList.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          final index = i;
          print(index);
          final MaterialColor color = _colors[index % _colors.length];
          return _buildRow(_cryptoList[index], color);
        });
  }

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

    return ListTile(
      leading: _getLeadingWidget(crypto['name'], color),
      title: Text(crypto['name']),
      subtitle: Text(
        cryptoPrice(crypto),
        style: _boldStyle,
      ),
      trailing: new IconButton(
        icon: Icon(favourited ? Icons.favorite : Icons.favorite_border),
        color: favourited ? Colors.red : null,
        onPressed: _fav,
      ),
    );
  }
}
