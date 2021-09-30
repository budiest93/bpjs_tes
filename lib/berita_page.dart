import 'dart:convert';

import 'package:coba/util/my_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'model/berita.dart';

class BeritaPage extends StatefulWidget {
  const BeritaPage({Key? key}) : super(key: key);

  @override
  _BeritaPageState createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {

  Future<List<BeritaData>?> _getAPIBerita() async {
    List<BeritaData>? listData = [];
    GetStorage storage = GetStorage();
    var token = storage.read("token");
    Uri url = Uri.parse("https://sfa.forcapos.xyz/api/news");
    var header = {
      "Authorization": "Bearer " + token
    };
    await http.get(url, headers: header).then((value) {
      var error = "";
      try {
        if (value.body.isNotEmpty) {
          var json = jsonDecode(value.body);
          Berita dataStatus = Berita.fromJson(json);
          if(dataStatus.status!.toUpperCase() == "OK"){
            listData = dataStatus.data;
          } else {
            error = dataStatus.message!;
          }
        } else {
          error = "Data tidak ada";
        }
      } catch(e) {
        error = "Ups.. Sepertinya ada masalah "+ e.toString();
      }
      MyUtil.showToast(error);
    });
    return listData;
  }

  _gridItem(BeritaData data) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            child: Image.network(
                data.mNewsImg ?? '',
                // height: 100,
                // width: 100,
            ),
          ),
          Container(
            child: Column(
              children: [
                Text(data.mNewsTitle ?? '', style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Text(data.mNewsDate ?? '', style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              ],
            ),
          )
        ],
      ),
    );
  }

  _gridBuilder() {
    return FutureBuilder<List<BeritaData>?>(
      future: _getAPIBerita(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GridView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            reverse: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
            ),
            itemBuilder: (context, index) {
              return _gridItem(snapshot.data![index]);
            },
            itemCount: snapshot.data?.length ?? 0,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Berita'),
      ),
      body: Container(
        child: _gridBuilder()
      ),
    );
  }
}
