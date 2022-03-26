import 'package:flutter/material.dart';
import 'package:wallet_fltr/screens/coin-view.dart';
import 'package:wallet_fltr/screens/notification.dart';
import 'package:wallet_fltr/screens/profile.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget tagList = Container(
      height: 60,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          coinPil(Colors.blue[100], "lib/assets/icons/bitcoin.png", "6.0286",
              "BTC", context),
          Padding(padding: EdgeInsets.only(right: 8)),
          coinPil(Colors.purple[100], "lib/assets/icons/eth.png", "16.0286",
              "ETH", context),
          Padding(padding: EdgeInsets.only(right: 8)),
          coinPil(Colors.green[100], "lib/assets/icons/doge.png", "0.0286",
              "DOGE", context),
          Padding(padding: EdgeInsets.only(right: 8)),
          coinPil(Colors.blueGrey[100], "lib/assets/icons/usd.png", "78.86",
              "USDT", context),
        ]),
      ),
    );

    Widget boardView = Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 25, 30, 10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            myStock(Colors.blue[100], "lib/assets/icons/bitcoin.png", "Bitcoin",
                "Payment for subscription", "+20\$"),
            Padding(padding: EdgeInsets.only(top: 25)),
            myStock(Colors.purple[100], "lib/assets/icons/eth.png", "Ethereum",
                "Payment for subscription", "+123\$"),
            Padding(padding: EdgeInsets.only(top: 25)),
            myStock(Colors.blueAccent, "lib/assets/icons/doge.png", "TON",
                "Payment for subscription", "+2.0012\$"),
          ],
        ),
      ),
    );

    return Scaffold(
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
              "Wallet",
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
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: new Column(
          children: <Widget>[tagList, Expanded(child: boardView)],
        ),
      ),
    );
  }
}

Widget myStock(_colorStock, String _imageStock, String _nameStock,
    String _subscription, String _activeStock) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: _colorStock,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    _imageStock,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _nameStock,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text(_subscription, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          Text(_activeStock,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        ],
      ),
      Padding(padding: EdgeInsets.only(bottom: 20)),
      Container(
        height: 2,
        color: Colors.grey[200],
      ),
    ],
  );
}

Widget coinPil(_coinPilColor, String _imageCoinPil, String _coinPilCost,
    String _coinPilName, context) {
  return InkWell(
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
                    coinName: _coinPilName,
                    coinFullName: _coinPilName,
                    coinCost: _coinPilCost,
                  )));
    },
    child: Container(
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: _coinPilColor,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
        child: Row(
          children: <Widget>[
            Image.asset(
              _imageCoinPil,
              height: 20,
              width: 20,
            ),
            Padding(padding: EdgeInsets.only(right: 8)),
            Text(
              _coinPilCost,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Padding(padding: EdgeInsets.only(right: 8)),
            Text(
              _coinPilName,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ),
  );
}
