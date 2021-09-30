import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  _NotifikasiPageState createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  _gridItem(var item) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(item['image'], height: 100),
          ),
          Column(

          )
        ],
      ),
    );
  }



  _gridBuilder() {
    var listItem = [];
    var mapItem = {
      'name': 'KARTU DIGITAL',
      'image': 'assets/icons/icon_card.PNG'
    };
    listItem.add(mapItem);
    mapItem = {
      'name': 'KECELAKAAN KERJA',
      'image': 'assets/icons/icon_report.PNG'
    };
    listItem.add(mapItem);
    mapItem = {
      'name': 'INFO PROGRAM',
      'image': 'assets/icons/icon_info.PNG'
    };
    listItem.add(mapItem);
    mapItem = {
      'name': 'MITRA LAYANAN',
      'image': 'assets/icons/icon_partner.PNG'
    };
    listItem.add(mapItem);
    mapItem = {
      'name': 'KANTOR CABANG',
      'image': 'assets/icons/icon_branch.PNG'
    };
    listItem.add(mapItem);
    mapItem = {
      'name': 'PENGADUAN',
      'image': 'assets/icons/icon_complaint.PNG'
    };
    listItem.add(mapItem);

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      reverse: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      itemBuilder: (buildContext, index) {
        return _gridItem(listItem[index]);
      },
      itemCount: listItem.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notifikasi'),
      ),
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: Text("Soon..."),
        ),
      ),
    );
  }
}
