import 'package:coba/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  getPage() {
    GetStorage storage = GetStorage();
    // storage.erase();
    var token = storage.read("token");
    print(token);
    if (token != null) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(
          create: (c) => MultiState()
      )],
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: getPage(),
          ),
        ),
      ),
    );
  }
}

class MultiState extends ChangeNotifier {
  String? token;

  setToken(String value) {
    this.token = value;
    notifyListeners();
  }
}


