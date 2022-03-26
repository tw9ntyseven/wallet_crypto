import 'package:flutter/material.dart';
import 'package:wallet_fltr/screens/notification.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
              "Profile",
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
        padding: const EdgeInsets.fromLTRB(30, 35.0, 30, 10),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(34.0),
                  child: Image(
                    image: AssetImage('lib/assets/images/avatar.jpg'),
                    width: 130,
                    height: 130,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 23)),
            Text(
              "Vlad Milicin",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            SizedBox(
              width: 250,
              height: 1,
              child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 203, 203, 203))),
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            InkWell(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 173, 237, 175),
                        borderRadius: BorderRadius.circular(18.0)),
                    child: Icon(Icons.dns_outlined),
                  ),
                  Padding(padding: EdgeInsets.only(left: 17)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Data",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Padding(padding: EdgeInsets.only(top: 6)),
                      Text(
                        "Personal user data",
                        style: TextStyle(
                            fontSize: 11,
                            color: Color.fromARGB(255, 126, 126, 126)),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            InkWell(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 241, 214, 255),
                        borderRadius: BorderRadius.circular(18.0)),
                    child: Icon(Icons.people_alt_outlined),
                  ),
                  Padding(padding: EdgeInsets.only(left: 17)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Friends",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Padding(padding: EdgeInsets.only(top: 6)),
                      Text(
                        "Friendly system users",
                        style: TextStyle(
                            fontSize: 11,
                            color: Color.fromARGB(255, 126, 126, 126)),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 247, 214),
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Icon(Icons.chat_outlined),
                      ),
                      Padding(padding: EdgeInsets.only(left: 17)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chats",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Padding(padding: EdgeInsets.only(top: 6)),
                          Text(
                            "Messages with users",
                            style: TextStyle(
                                fontSize: 11,
                                color: Color.fromARGB(255, 126, 126, 126)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 72, 63, 255),
                        borderRadius: BorderRadius.circular(18.0)),
                    child: Center(
                        child: Text(
                      "10",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    )),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            InkWell(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 182, 244, 255),
                        borderRadius: BorderRadius.circular(18.0)),
                    child: Icon(Icons.settings_outlined),
                  ),
                  Padding(padding: EdgeInsets.only(left: 17)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account Settings",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Padding(padding: EdgeInsets.only(top: 6)),
                      Text(
                        "System updates and alerts",
                        style: TextStyle(
                            fontSize: 11,
                            color: Color.fromARGB(255, 126, 126, 126)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
