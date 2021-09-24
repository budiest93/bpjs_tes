
import 'package:coba/HomePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  var isLogin = false;

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

  getLogin(){
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Masuk ke Akun Saya', textAlign: TextAlign.center,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'NAMA PENGGUNA',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'KATA SANDI',
              ),
              keyboardType: TextInputType.visiblePassword,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isLogin ? getAppbar() : null,
        body: SingleChildScrollView(
          child: Column(
          children: [
            Container(
              child: Image.asset('assets/images/img_splash_header.jpeg'),
            ),
            isLogin ? getLogin() : getHome(),
            Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isLogin == false) {
                      isLogin = true;
                    } else{
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()));
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
            )
          ],
      ),
        ),
    );
  }
}