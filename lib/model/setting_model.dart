class Setting {
  Setting({this.key, this.data, this.msg, this.code});

  Setting.fromJson(dynamic json) {
    key = json['key'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }

  String? key;
  Data? data;
  String? msg;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['msg'] = msg;
    map['code'] = code;
    return map;
  }
}

/// id : 1
/// name : "اوكتوبوس"
/// email : "info@mycompany.com"
/// phone : "+15149996592"
/// whatsapp : "+15149996592"
/// logo : "https://octobossapp.com/storage/images/logo/GNhZUPYEQHYzB4CuLHtpi1RO2nmlNpZDurbAbVKp.png"
/// fav_icon : "https://octobossapp.com/storage/images/fav_icon/zOKkyVdRWrt401RtH90QAW35PGUt7K2BRotIFnca.png"
/// home_banner : ["https://octobossapp.com/storage/images/banner/ngLig4w3KJkqnMd2J8llu7TXtaxayYkOmRq16mGR.png","https://octobossapp.com/storage/images/banner/62ewMwhVdreWjfsRM0dck5nMRiIgfaXlCLDBlG6P.png","https://octobossapp.com/storage/images/banner/vysUWC9l2NEezP7oXXv8P4eqCI1WsdMg37BFaZZS.png","https://octobossapp.com/storage/images/banner/EZhXqUwyxu7vP2Z70mgo1gDmp9dCsvphkQecpLZj.png","https://octobossapp.com/storage/images/banner/lkcy5u9MjMZ3z8DHG9Ebm6WBDbIMThdByLTkNhXz.jpg"]
/// android_app_link : null
/// apple_app_link : null

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.whatsapp,
    this.logo,
    this.favIcon,
    this.homeBanner,
    this.androidAppLink,
    this.appleAppLink,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    logo = json['logo'];
    favIcon = json['fav_icon'];
    homeBanner = json['home_banner'] != null
        ? json['home_banner'].cast<String>()
        : [];
    androidAppLink = json['android_app_link'];
    appleAppLink = json['apple_app_link'];
  }

  int? id;
  String? name;
  String? email;
  String? phone;
  String? whatsapp;
  String? logo;
  String? favIcon;
  List<String>? homeBanner;
  dynamic androidAppLink;
  dynamic appleAppLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['whatsapp'] = whatsapp;
    map['logo'] = logo;
    map['fav_icon'] = favIcon;
    map['home_banner'] = homeBanner;
    map['android_app_link'] = androidAppLink;
    map['apple_app_link'] = appleAppLink;
    return map;
  }
}
