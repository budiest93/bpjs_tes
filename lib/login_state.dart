import 'dart:convert';

import 'package:coba/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/login.dart';

class LoginState extends ChangeNotifier {
  TextEditingController uname = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  final formKey = GlobalKey<FormState>();
  String? warning;
  LoginData? data;
  bool? muncul = false;
  MultiState? ms;
  BuildContext context;

  LoginState(this.ms, this.context) {

  }

  prosesLogin() async {
    this.muncul = false;
    this.warning = "";
    this.data = null;
    notifyListeners();
    Uri url = Uri.parse("https://sfa.forcapos.xyz/api/account/login");
    var header;
    var body = {
      "m_akun_namapengguna": uname.text,
      "m_akun_password": pass.text
    };
    await http.post(url, headers: header, body: body).then((value) {
      print(value.body);
      try {
        if (value.body.isNotEmpty) {
          var json = jsonDecode(value.body);
          Login dataStatus = Login.fromJson(json);
          if(dataStatus.status!.toUpperCase() == "OK"){
            if(dataStatus.data!.length > 0){
              data = dataStatus.data!.first;
              this.muncul = true;
            } else {
              this.warning = "Data kosong";
            }
          } else {
            this.warning = dataStatus.message;
          }
        } else {
          this.warning = "Data tidak ada";
        }
      } catch(e) {
        this.warning = "Ups.. Sepertinya ada masalah "+ e.toString();
      }
      notifyListeners();
    });
  }
}