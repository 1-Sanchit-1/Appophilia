import 'dart:convert';

import 'package:appophilia/models/game_model_id.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/game_model.dart';

class game_data extends StatefulWidget {
  int? id;
  game_data({required this.id});
  @override
  State<game_data> createState() => _game_dataState();
}

class _game_dataState extends State<game_data> {
  List<GameModelId> gameid = [];
  String? url;
  bool isLoading=true ;
  Future<GameModelId?> gameids(int id) async {
    print(id);
    url = "https://www.freetogame.com/api/game?id=${id}";
    Response response = await get(Uri.parse(url!));
    var data = jsonDecode(response.body);
    print(json.decode(response.body).runtimeType);
    print(response.statusCode.toString());
    print("------------------");
    try {
      if (response.statusCode == 200) {
        isLoading=false ;
        var da= GameModelId.fromJson(data);
        if(da!=null)
        return da ;
        else
          {
            Container(child: Center(
              child: Text("No Data found in API"),
            ),);
          }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    gameids(widget.id!.toInt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("All about Game"),
         centerTitle: true,
          ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
              future: gameids(widget.id!.toInt()),
              builder: (context, snapshot) {
                if (snapshot.hasData == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return isLoading
                      ? Center(
                        child: CircularProgressIndicator(
                    backgroundColor: Colors.tealAccent,
                  ),
                      ) : Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 45,
                        ),
                        Center(
                          child: Text(snapshot.data!.title,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          height: 225,
                          child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.screenshots.length,
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
                                        snapshot.data!.screenshots[index].image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ]
                                  ));
                            },
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed: ()async{
                              final uri = Uri.parse(snapshot.data!.gameUrl);
                              print(uri);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                                child: Text("Play"))
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Text("Genre :",style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 22,
                                color: Colors.purpleAccent
                              ),),
                              SizedBox(width: 10,),
                              Text(snapshot.data!.genre,style: TextStyle(
                                color: Colors.red ,
                                fontSize: 22,
                              ),),
                              SizedBox(width: 10,),
                              Text("||" , style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                              SizedBox(width: 10,),
                              Text("Plateform :",style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 22,
                                  color: Colors.purpleAccent
                              ),),
                              SizedBox(width: 10,),
                              Text(snapshot.data!.platform,style: TextStyle(
                                color: Colors.red ,
                                fontSize: 22,
                              ),),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Text("Developer:",style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 12,
                                  color: Colors.purple
                              ),),
                              SizedBox(width: 10,),
                              Text(snapshot.data!.developer,style: TextStyle(
                                color: Colors.red ,
                                fontSize: 12,
                              ),),
                              SizedBox(width: 10,),
                              Text("||" , style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                              SizedBox(width: 10,),
                              Text("Release-date :",style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 12,
                                  color: Colors.purpleAccent
                              ),),
                              SizedBox(width: 10,),
                              Text(snapshot.data!.releaseDate.toString().substring(0,10),style: TextStyle(
                                color: Colors.red ,
                                fontSize: 12,
                              ),),
                            ],
                          ),
                        ),
                        Text("About Game",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 20,
                          color: Colors.teal
                        ),),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(15),
                            child: Text(snapshot.data!.shortDescription)),
                        Divider(),
                        Text("Minimum System Requirement",style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 20,
                            color: Colors.teal
                        ),),
                        Column(
                          children: [
                            Text("Graphics :" + snapshot.data!.minimumSystemRequirements.graphics),
                            Text("Memory :" +snapshot.data!.minimumSystemRequirements.memory),
                            Text("Operating System :" +snapshot.data!.minimumSystemRequirements.os),
                            Text("Processor :" +snapshot.data!.minimumSystemRequirements.processor),
                            Text("Storage :" +snapshot.data!.minimumSystemRequirements.storage),
                          ],

                        )
                      ],
                    ),
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
