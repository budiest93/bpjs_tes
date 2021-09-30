
import 'package:coba/home_page.dart';
import 'package:coba/login_state.dart';
import 'package:coba/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  var isLogin = false;
  MultiState? ms;

  getHome(){
    return Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  child: Image.asset('assets/icons/icon_new_member.jpeg', height: 150,),
                ),
                Text('PENDAFTARAN\nPESERTA BARU',textAlign: TextAlign.center,)
              ],
            ),
            SizedBox(width: 35,),
            Column(
              children: [
                Container(
                  child: Image.asset('assets/icons/icon_new_user.jpeg', height: 150,),
                ),
                Text('PENDAFTARAN\nPENGGUNA BARU',textAlign: TextAlign.center),
              ],
            ),
          ],
        )
    );
  }

  getLogin(state){
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Masuk ke Akun Saya', textAlign: TextAlign.center,),
            TextFormField(
              controller: state.uname,
              decoration: InputDecoration(
                hintText: 'NAMA PENGGUNA',
              ),
            ),
            TextFormField(
              controller: state.pass,
              decoration: InputDecoration(
                hintText: 'KATA SANDI',
              ),
              obscureText: true,
            )
          ],
        )
    );
  }

  getAppbar(){
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          setState(() {
            isLogin = false;
          });
        },
      ),
      centerTitle: true,
    );
  }

  void showToast(state) {
    if (state.warning != null) {
      Fluttertoast.showToast(
          msg: state.warning,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  goLogin(state) async {
    await state.prosesLogin();
    showToast(state);
    if (state.muncul == true && state.data != null) {
      GetStorage storage = GetStorage();
      storage.write("token", "${state.data!.mToken}");
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    ms = Provider.of<MultiState>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginState(this.ms, context),
      child: Consumer<LoginState>(builder: (context, state, _) {
        return Scaffold(
            appBar: isLogin ? getAppbar() : null,
            body: SingleChildScrollView(
                child: Column(
                children: [
                  Container(
                    child: Image.asset('assets/images/img_splash_header.jpeg'),
                  ),
                  isLogin ? getLogin(state) : getHome(),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (isLogin == false) {
                            isLogin = true;
                          } else{
                            goLogin(state);
                          }
                        });
                      },
                      child: Text('LOGIN'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.blue
                        ),
                        fixedSize: MaterialStateProperty.all(
                          Size.fromWidth(double.maxFinite)
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
        );
      })
    );
  }
}