// To parse this JSON data, do
//
//     final pegawaiModel = pegawaiModelFromJson(jsonString);

import 'dart:convert';

PegawaiModel pegawaiModelFromJson(String str) => PegawaiModel.fromJson(json.decode(str));

String pegawaiModelToJson(PegawaiModel data) => json.encode(data.toJson());

class PegawaiModel {
    PegawaiModel({
        this.isSuccess,
        this.message,
        this.data,
    });

    bool isSuccess;
    String message;
    List<Pegawai> data;

    factory PegawaiModel.fromJson(Map<String, dynamic> json) => PegawaiModel(
        isSuccess: json["is_success"] == null ? null : json["is_success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : List<Pegawai>.from(json["data"].map((x) => Pegawai.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "is_success": isSuccess == null ? null : isSuccess,
        "message": message == null ? null : message,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Pegawai {
    Pegawai({
        this.id,
        this.nama,
        this.posisi,
        this.gaji,
    });

    String id;
    String nama;
    String posisi;
    String gaji;

    factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        posisi: json["posisi"] == null ? null : json["posisi"],
        gaji: json["gaji"] == null ? null : json["gaji"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nama": nama == null ? null : nama,
        "posisi": posisi == null ? null : posisi,
        "gaji": gaji == null ? null : gaji,
    };
}
