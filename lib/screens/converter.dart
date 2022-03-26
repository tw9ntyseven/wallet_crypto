import 'package:flutter/material.dart';
import 'package:wallet_fltr/screens/coin-view.dart';
import 'package:wallet_fltr/screens/notification.dart';
import 'package:wallet_fltr/screens/profile.dart';

class Converter extends StatefulWidget {
  const Converter({Key? key}) : super(key: key);

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String dropdownSetValue = 'BTC';
  String dropdownGetValue = 'BTC';

  @override
  Widget build(BuildContext context) {
    var _send = new TextEditingController();
    var _get = new TextEditingController();

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
              "Converter",
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 15, 30, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                coinCardConverter(Colors.blue[100], "BTC", "+6%", "6.0286",
                    "Bitcoin", "lib/assets/icons/bitcoin.png", context),
                coinCardConverter(Colors.purple[100], "ETH", "+18%", "0.0086",
                    "Ethereum", "lib/assets/icons/eth.png", context),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                coinCardConverter(Colors.green[100], "DOGE", "+118%", "16.800",
                    "Dogecoin", "lib/assets/icons/doge.png", context),
                coinCardConverter(Colors.blueGrey[100], "USDT", "+78%", "7.860",
                    "Dollars", "lib/assets/icons/usd.png", context),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            new Row(
              children: <Widget>[
                new Flexible(
                    child: TextField(
                  controller: _send,
                  decoration: InputDecoration(
                    labelText: "Send",
                    border: InputBorder.none,
                  ),
                )),
                Text(""),
                DropdownButton<String>(
                  underline: SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down),
                  value: dropdownSetValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownSetValue = newValue!;
                    });
                  },
                  items: <String>['BTC', 'ETH', 'DOGE', 'TON']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.swap_horiz_outlined),
                    color: Colors.white,
                    splashColor: Colors.white,
                  ),
                ),
                Text(""),
              ],
            ),
            new Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _get,
                    decoration: InputDecoration(
                      labelText: "Get",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text(""),
                DropdownButton<String>(
                  underline: SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down),
                  value: dropdownGetValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownGetValue = newValue!;
                    });
                  },
                  items: <String>['BTC', 'ETH', 'DOGE', 'TON']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget coinCardConverter(_color, String _coinName, String _coinUpd,
    String _coinPrice, String _coinFullName, String _imageCoin, context) {
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
                    coinName: _coinName,
                    coinFullName: _coinFullName,
                    coinCost: _coinPrice,
                  )));
    },
    child: Container(
      width: 150,
      height: 150,
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
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  _imageCoin,
                  height: 20,
                  width: 20,
                ),
                Padding(padding: EdgeInsets.only(right: 8)),
                Text(_coinFullName),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
