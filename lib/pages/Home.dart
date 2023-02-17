import 'dart:convert';

import 'package:appophilia/models/game_model.dart';
import 'package:appophilia/models/game_model_id.dart';
import 'package:appophilia/pages/game_cata.dart';
import 'package:appophilia/pages/game_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  String? url;
  List<Games> game = [];
  List<Games> crousallist = [];

  Future<List<Games>?> games() async {
    url = "https://www.freetogame.com/api/games";
    Response response = await get(Uri.parse(url!));
    var data = jsonDecode(response.body);
    print(json.decode(response.body).runtimeType);
    print(response.statusCode.toString());
    print("------------------");
    try {
      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in data) {
          game.add(Games.fromJson(index));
          crousallist.add(Games.fromJson(index));
        }
        print(game.length);
        return game;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  List<GameModelId> gameid = [];
  List<Games> cata = [];
  String? urll;
  Future<List<Games>?> gameids() async {
    urll = "https://www.freetogame.com/api/games?category=shooter";
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

  @override
  void initState() {
    games();
    gameids();
    super.initState();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: FutureBuilder(
        future: games(),
        builder: (context, snapshot) {
          if (snapshot.hasData == null) {
            return Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  catlist(),
                  SizedBox(
                    height: 15,
                  ),
                  crousel(),
                  gamelist(),
                  SizedBox(
                    height: 30,
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  catlist() {
    return Container(
      height: 50,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cat.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    game_cate(cat: cat[index],),
                  ));
              // print(list[index]);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(
                cat[index],
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          );
        },
      ),
    );
  }

  shooting() {
    return Container(
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
              ]));
        },
      ),
    );
  }

  crousel() {
    return CarouselSlider(
      options: CarouselOptions(
        // height: MediaQuery.of(context).size.height,
        height: 175,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      items: crousallist.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                // decoration: BoxDecoration(color: Colors.black12),
                child: InkWell(
                    onTap: () {
                      print(i.id);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => game_data(id: i.id)));
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              i.thumbnail,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ]))));
          },
        );
      }).toList(),
    );
  }

  gamelist() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: game.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [],
          ),
        );
      },
    );
  }
}
