import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/game_model.dart';

class game_cate extends StatefulWidget {
  String? cat ;
  game_cate({required String cat}) ;
  @override
  State<game_cate> createState() => _game_cateState();
}

class _game_cateState extends State<game_cate> {

  List<Games> cata = [];
  String? urll;
  Future<List<Games>?> gameids(String cat) async {
    urll = "https://www.freetogame.com/api/games?category=$cat";
    Response response = await get(Uri.parse(urll!));
    var data = jsonDecode(response.body);
    print(json.decode(response.body).runtimeType);
    print(response.statusCode.toString());
    print("------------------");
    try {
      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in data) {
          cata.add(Games.fromJson(index));
        }
        return cata;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  List<String> cat = [
    "mmorpg",
    "shooter",
    "strategy",
    "moba",
    "racing",
    "sports",
    "social",
    "sandbox",
    "open-world",
    "survival",
    "pvp",
    "pve",
    "pixel",
    "voxel",
    "zombie",
    "turn-based",
    "first-person",
    "third-Person",
    "top-down",
    "tank",
    "space",
    "sailing",
    "side-scroller",
    "superhero",
    "permadeath",
    "card",
    "battle-royale",
    "mmo",
    "mmofps",
    "mmotps",
    "3d",
    "2d",
    "anime",
    "fantasy",
    "sci-fi",
    "fighting",
    "action-rpg",
    "action",
    "military",
    "martial-arts",
    "flight",
    "low-spec",
    "tower-defense",
    "horror",
    "mmorts",
  ];

  @override
  void initState() {
    gameids();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catagery"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Shooting"),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(15),
              height: 225,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: cata.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            cata[index].thumbnail,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ]
                      ));
                },
              ),
            ),
            SizedBox(height: 15,),
            Text("flight",),
            Container(
              padding: EdgeInsets.all(15),
              height: 225,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: cata.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            cata[index].thumbnail,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ]
                      ));
                },
              ),
            ),


          ],

        ),
      ),
    );
  }
  catgery(){

  }
}
