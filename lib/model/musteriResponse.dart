class Musteri {
    int id;
    String musteriKod;
    String musteriAdi;
    String adres;
    String il;
    String ilce;
    String telefon;
    bool aktif;

    Musteri({
        required this.id,
        required this.musteriKod,
        required this.musteriAdi,
        required this.adres,
        required this.il,
        required this.ilce,
        required this.telefon,
        required this.aktif,
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
