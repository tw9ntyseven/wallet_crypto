import 'package:flutter/material.dart';
import 'package:wallet_fltr/screens/coin-view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('lib/assets/images/avatar.jpg'),
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
              onPressed: () {},
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
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    // BITCOIN BTC BTC
                    coinCard(Colors.blue[100], "BTC", "+6%", "6.0286",
                        "Bitcoin", "lib/assets/icons/bitcoin.png", context),

                    Padding(padding: EdgeInsets.only(right: 10)),

                    // ETH ETH ETH ETH
                    coinCard(Colors.purple[100], "ETH", "+18%", "0.0086",
                        "Ethereum", "lib/assets/icons/eth.png", context),

                    Padding(padding: EdgeInsets.only(right: 10)),

                    // DOGE DOGE DOGE
                    coinCard(Colors.green[100], "DOGE", "+118%", "16.800",
                        "Dogecoin", "lib/assets/icons/doge.png", context),

                    Padding(padding: EdgeInsets.only(right: 10)),

                    // USD USD USD
                    coinCard(Colors.blueGrey[100], "USDT", "+78%", "7.860",
                        "Dollars", "lib/assets/icons/usd.png", context),

                    Padding(padding: EdgeInsets.only(right: 10)),

                    coinCard(Colors.orange[100], "TON", "+0.039", "1.651",
                        "Toncoin", "lib/assets/icons/usd.png", context)
                  ],
                ),
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
