
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayananPage extends StatefulWidget {
  const LayananPage({Key? key}) : super(key: key);

  @override
  _LayananPageState createState() => _LayananPageState();
}

class _LayananPageState extends State<LayananPage> {

  _gridItem(var item) {
    return Column(
      children: [
        // Expanded(child: FlutterLogo(size: double.infinity)),
        Image.asset(item['image'], height: 100),
        SizedBox(height: 5,),
        Text(item['name'], style: TextStyle(fontSize: 12)),
      ],
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
        crossAxisCount: 3,
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
        title: Text('BPJSTKU'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text('JAMINAN HARI TUA (JHT)', textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/icons/icon_saldo.PNG', height: 100,),
                      Image.asset('assets/icons/icon_simulation.PNG', height: 100),
                      Image.asset('assets/icons/icon_queue.PNG', height: 100),
                    ],
                  ),
                  SizedBox(height: 15,),
                ],
              ),
              color: Colors.blue,
            ),
            SizedBox(height: 15,),
            Container(
              child: _gridBuilder(),
            )
          ],
        )
      ),
    );
  }
}
