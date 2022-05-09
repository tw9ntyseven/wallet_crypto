// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:core';
// import 'package:http/http.dart' as http;

// // Function getting from API crypto DATA
// Future<void> getCryptoPrices() async {
//   List cryptoDatas = [];
//   String _apiURL =
//       "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?id=1,2,3,4,5,6,7,8,9,10";
//   setState(() {
//     this._loading = true;
//   });
//   http.Response response = await http.get(Uri.parse(_apiURL),
//       headers: {"X-CMC_PRO_API_KEY": "97c1020e-854b-4367-a2cd-84546155371e"});

//   Map<String, dynamic> responseJSON = json.decode(response.body);
//   if (responseJSON["status"]["error_code"] == 0) {
//     for (int i = 1; i <= responseJSON["data"].length; i++) {
//       cryptoDatas.add(responseJSON["data"][i.toString()]);
//     }
//   }
//   print(cryptoDatas);

//   setState(() {
//     this._cryptoList = cryptoDatas;
//     this._loading = false;
//   });
//   return;
// }
