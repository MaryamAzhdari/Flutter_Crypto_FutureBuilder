// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'dart:convert';

class CryptoEntityHttp {
  List<DataHttp> data;

  CryptoEntityHttp({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Data': data,
    };
  }

  String toJson() => json.encode(toMap());

  factory CryptoEntityHttp.fromJson(Map<String, dynamic> map) {
    return CryptoEntityHttp(
      data: map['Data'] as List<DataHttp>,
    );
  }
}

class DataHttp {
  CoinInfoHttp coinInfo;
  DISPLAYHttp display;
  DataHttp({
    required this.coinInfo,
    required this.display,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'CoinInfo': coinInfo, 'DISPLAY': display};
  }

  String toJson() => json.encode(toMap());

  factory DataHttp.fromJson(Map<String, dynamic> map) {
    return DataHttp(
      coinInfo: map['CoinInfo'] as CoinInfoHttp,
      display: map['DISPLAY'] as DISPLAYHttp,
    );
  }
}

class CoinInfoHttp {
  String Name;
  String FullName;
  String imageUrl;
  CoinInfoHttp({
    required this.Name,
    required this.FullName,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Name': Name,
      'FullName': FullName,
      'ImageUrl': imageUrl,
    };
  }

  String toJson() => json.encode(toMap());

  factory CoinInfoHttp.fromJson(Map<String, dynamic> map) {
    return CoinInfoHttp(
      Name: map['Name'] as String? ?? "",
      FullName: map['FullName'] as String? ?? "",
      imageUrl: map['ImageUrl'] as String? ?? "",
    );
  }
}

class DISPLAYHttp {
  USD_DISPLAYHttp? usd;
  DISPLAYHttp({
    required this.usd,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'USD': usd};
  }

  String toJson() => json.encode(toMap());

  factory DISPLAYHttp.fromJson(Map<String, dynamic> map) {
    return DISPLAYHttp(usd: map['USD'] as USD_DISPLAYHttp?);
  }
}

class USD_DISPLAYHttp {
  String PRICE;
  String CHANGEPCT24HOUR;

  USD_DISPLAYHttp({
    required this.PRICE,
    required this.CHANGEPCT24HOUR,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'PRICE': PRICE,
      'CHANGEPCT24HOUR': CHANGEPCT24HOUR
    };
  }

  String toJson() => json.encode(toMap());

  factory USD_DISPLAYHttp.fromJson(Map<String, dynamic> map) {
    return USD_DISPLAYHttp(
        PRICE: map['PRICE'] as String,
        CHANGEPCT24HOUR: map['CHANGEPCT24HOUR'] as String);
  }
}

class MetaData {
  int Count;

  MetaData({
    required this.Count,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'MARKET': Count,
    };
  }

  String toJson() => json.encode(toMap());

  factory MetaData.fromJson(Map<String, dynamic> map) {
    return MetaData(
      Count: map['Count'] as int,
    );
  }
}
