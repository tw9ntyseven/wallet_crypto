import 'package:flutter/material.dart';
import 'package:sparkline/sparkline.dart';
import 'package:wallet_fltr/screens/coin-view.dart';

class Stat extends StatelessWidget {
  const Stat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('lib/assets/images/avatar.jpg'),
              ),
              Text(
                "Statistics",
                style: TextStyle(color: Colors.black),
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    coinStats(
                        "lib/assets/icons/usd.png",
                        "Dollars",
                        "USDT",
                        "7.860",
                        [
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
                        context),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    coinStats(
                        "lib/assets/icons/eth.png",
                        "Ethereum",
                        "ETH",
                        "10.860",
                        [
                          0.0,
                          1.0,
                          2.5,
                          2.0,
                          5.0,
                          0.0,
                          -0.5,
                          -1.0,
                          -0.5,
                          0.0,
                          0.0
                        ],
                        context),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    coinStats(
                        "lib/assets/icons/bitcoin.png",
                        "Bitcoin",
                        "BTC",
                        "19.860",
                        [
                          0.0,
                          3.0,
                          3.5,
                          4.0,
                          5.0,
                          9.0,
                          -0.5,
                          -1.0,
                          -0.5,
                          0.0,
                          0.0
                        ],
                        context),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

Widget coinStats(String _imageCoin, String _coinFullName, String _coinName,
    String _coinCost, data, context) {
  return Container(
    width: 340,
    height: 250,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.white),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 25, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
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
                            coinCost: _coinCost,
                          )));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      _imageCoin,
                      height: 20,
                      width: 20,
                    ),
                    Padding(padding: EdgeInsets.only(right: 8)),
                    Text(
                      _coinFullName,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(_coinName,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700)),
                    Padding(padding: EdgeInsets.only(right: 8)),
                    Text(_coinCost,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700)),
                  ],
                )
              ],
            ),
          ),
          new Sparkline(
            data: data,
            pointsMode: PointsMode.all,
            pointSize: 5,
            labelPrefix: "\$",
            fillMode: FillMode.below,
          ),
        ],
      ),
    ),
  );
}
