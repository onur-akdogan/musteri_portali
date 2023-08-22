// To parse this JSON data, do
//
//     final getMusteriSozlemeleri = getMusteriSozlemeleriFromJson(jsonString);

import 'dart:convert';

List<GetMusteriSozlemeleri> getMusteriSozlemeleriFromJson(String str) =>
    List<GetMusteriSozlemeleri>.from(
        json.decode(str).map((x) => GetMusteriSozlemeleri.fromJson(x)));

String getMusteriSozlemeleriToJson(List<GetMusteriSozlemeleri> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMusteriSozlemeleri {
  int? id;
  Musteri? musteri;
  int? yil;
  double? ysmMiktar;
  double? azamiYillikMiktar;
  double? aatOrani;

  GetMusteriSozlemeleri({
    this.id,
    this.musteri,
    this.yil,
    this.ysmMiktar,
    this.azamiYillikMiktar,
    this.aatOrani,
  });

  factory GetMusteriSozlemeleri.fromJson(Map<String, dynamic> json) =>
      GetMusteriSozlemeleri(
        id: json["id"],
        musteri:
            json["musteri"] == null ? null : Musteri.fromJson(json["musteri"]),
        yil: json["yil"],
        ysmMiktar: json["ysmMiktar"],
        azamiYillikMiktar: json["azamiYillikMiktar"],
        aatOrani: json["aatOrani"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "musteri": musteri?.toJson(),
        "yil": yil,
        "ysmMiktar": ysmMiktar,
        "azamiYillikMiktar": azamiYillikMiktar,
        "aatOrani": aatOrani,
      };
}

class Musteri {
  int? id;
  String? musteriKod;
  String? musteriAdi;
  String? adres;
  String? il;
  String? ilce;
  String? telefon;
  bool? aktif;

  Musteri({
    this.id,
    this.musteriKod,
    this.musteriAdi,
    this.adres,
    this.il,
    this.ilce,
    this.telefon,
    this.aktif,
  });

  factory Musteri.fromJson(Map<String, dynamic> json) => Musteri(
        id: json["id"],
        musteriKod: json["musteriKod"],
        musteriAdi: json["musteriAdi"],
        adres: json["adres"],
        il: json["il"],
        ilce: json["ilce"],
        telefon: json["telefon"],
        aktif: json["aktif"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "musteriKod": musteriKod,
        "musteriAdi": musteriAdi,
        "adres": adres,
        "il": il,
        "ilce": ilce,
        "telefon": telefon,
        "aktif": aktif,
      };
}
