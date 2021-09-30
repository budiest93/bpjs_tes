/// status : "OK"
/// message : "Login Sukses"
/// data : [{"m_akun_id":0,"m_akun_namapengguna":"elfasa","m_akun_email":"satu@gmail.com","m_akun_link_photo":"NULL","m_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvc2ZhLmZvcmNhcG9zLnh5elwvYXBpXC9hY2NvdW50XC9sb2dpbiIsImlhdCI6MTYzMjc5NjcxOSwibmJmIjoxNjMyNzk2NzE5LCJqdGkiOiJFamxtSHE5NkVpRXViR09XIiwic3ViIjowLCJwcnYiOiJmYzQ5NTU4OTUyNmI3NjRiM2VjOGE5NWZlNjkwN2U1N2VmOWI4YzRjIn0.GsGw_OCffbyiBIzlJoWrJ-BXwWgvnMeKK-wSc_0irF0"}]

class Login {
  Login({
      String? status, 
      String? message, 
      List<LoginData>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  Login.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(LoginData.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  List<LoginData>? _data;

  String? get status => _status;
  String? get message => _message;
  List<LoginData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// m_akun_id : 0
/// m_akun_namapengguna : "elfasa"
/// m_akun_email : "satu@gmail.com"
/// m_akun_link_photo : "NULL"
/// m_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvc2ZhLmZvcmNhcG9zLnh5elwvYXBpXC9hY2NvdW50XC9sb2dpbiIsImlhdCI6MTYzMjc5NjcxOSwibmJmIjoxNjMyNzk2NzE5LCJqdGkiOiJFamxtSHE5NkVpRXViR09XIiwic3ViIjowLCJwcnYiOiJmYzQ5NTU4OTUyNmI3NjRiM2VjOGE5NWZlNjkwN2U1N2VmOWI4YzRjIn0.GsGw_OCffbyiBIzlJoWrJ-BXwWgvnMeKK-wSc_0irF0"

class LoginData {
  LoginData({
      int? mAkunId, 
      String? mAkunNamapengguna, 
      String? mAkunEmail, 
      String? mAkunLinkPhoto, 
      String? mToken,}){
    _mAkunId = mAkunId;
    _mAkunNamapengguna = mAkunNamapengguna;
    _mAkunEmail = mAkunEmail;
    _mAkunLinkPhoto = mAkunLinkPhoto;
    _mToken = mToken;
}

  LoginData.fromJson(dynamic json) {
    _mAkunId = json['m_akun_id'];
    _mAkunNamapengguna = json['m_akun_namapengguna'];
    _mAkunEmail = json['m_akun_email'];
    _mAkunLinkPhoto = json['m_akun_link_photo'];
    _mToken = json['m_token'];
  }
  int? _mAkunId;
  String? _mAkunNamapengguna;
  String? _mAkunEmail;
  String? _mAkunLinkPhoto;
  String? _mToken;

  int? get mAkunId => _mAkunId;
  String? get mAkunNamapengguna => _mAkunNamapengguna;
  String? get mAkunEmail => _mAkunEmail;
  String? get mAkunLinkPhoto => _mAkunLinkPhoto;
  String? get mToken => _mToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['m_akun_id'] = _mAkunId;
    map['m_akun_namapengguna'] = _mAkunNamapengguna;
    map['m_akun_email'] = _mAkunEmail;
    map['m_akun_link_photo'] = _mAkunLinkPhoto;
    map['m_token'] = _mToken;
    return map;
  }

}