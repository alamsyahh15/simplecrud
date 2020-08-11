import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_crud/model/pegawai_model.dart';

class PegawaiRepo {
  String baseUrl = "http://192.168.10.232/server_pegawai/";
  
  /// Repository Get Pegawai
  Future getPegawai() async {
    try {
      final response = await http.get(baseUrl + "getPegawai.php");
      if (pegawaiModelFromJson(response.body)?.isSuccess == true) {
        return pegawaiModelFromJson(response.body).data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  /// Repository Add Pegawai
  Future addPegawai(Pegawai pegawai) async {
    try {
      final response = await http.post(baseUrl + "addPegawai.php", body: {
        'namaPegawai': pegawai.nama,
        'posisiPegawai': pegawai.posisi,
        'gajiPegawai': pegawai.gaji,
      });
      print(jsonDecode(response.body));
      if (pegawaiModelFromJson(response.body)?.isSuccess == true) {
        return pegawaiModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  /// Repository Update Pegawai
  Future updatePegawai(Pegawai pegawai) async {
    try {
      final response = await http.post(baseUrl + "editPegawai.php", body: {
        'idPegawai': pegawai.id,
        'namaPegawai': pegawai.nama,
        'posisiPegawai': pegawai.posisi,
        'gajiPegawai': pegawai.gaji,
      });
      if (pegawaiModelFromJson(response.body)?.isSuccess == true) {
        return pegawaiModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  /// Repository Delete Pegawai
  Future deletePegawai(Pegawai pegawai) async {
    try {
      final response = await http.post(baseUrl + "deletePegawai.php", body: {
        'idPegawai': pegawai.id,
      });
      if (pegawaiModelFromJson(response.body)?.isSuccess == true) {
        return pegawaiModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

final pegawaiRepo = PegawaiRepo();
