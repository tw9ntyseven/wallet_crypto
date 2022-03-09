import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:sparkline/sparkline.dart';

class CoinView extends StatefulWidget {
  String coinName;
  String coinFullName;
  String coinCost;
  var datas;

  CoinView(
      {Key? key,
      required this.coinName,
      required this.coinFullName,
      required this.coinCost,
      required this.datas})
      : super(key: key);

  @override
  State<CoinView> createState() => _CoinViewState();
}

class _CoinViewState extends State<CoinView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                widget.coinFullName,
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                child: Cube(
                  onSceneCreated: (Scene scene) {
                    scene.world.add(Object(
                        fileName: 'lib/assets/3d/earth/earth_ball.obj',
                        scale: Vector3.all(9)));
                  },
                ),
              ),
              Column(
                children: [
                  Text(
                    widget.coinName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(widget.coinCost,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700))
                ],
              ),
              coinStats(widget.datas),
            ],
          ),
        ));
  }
}

Widget coinStats(data) {
  return Container(
    width: 340,
    height: 170,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Sparkline(
          data: data,
          pointsMode: PointsMode.all,
          pointSize: 5,
          labelPrefix: "\$",
          fillMode: FillMode.below,
        ),
      ],
    ),
  );
}
