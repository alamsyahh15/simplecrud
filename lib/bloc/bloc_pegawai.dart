import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_crud/model/pegawai_model.dart';
import 'package:simple_crud/repo/pegawai_repository.dart';

class BlocPegawai extends ChangeNotifier {
  /// variable global
  List<Pegawai> listPegawai = [];
  bool isLoading = false;

  /// Buat constructor ketika bloc pertama kali dipanggil maka akan menjalankan func getData
  BlocPegawai() {
    this.getData();
  }

  // Function get Data
  void getData() {
    // ketika pertama kali func dijalankan maka akan merubah nilai isLoading menjadi aktif
    isLoading = true;
    notifyListeners();
    pegawaiRepo.getPegawai().then((value) {
      // setelah func selesai dijalankan maka akan merubah nilai isLoading menjadi nonaktif
      isLoading = false;

      if (value != null) {
        /// Memasukan nilai balikan dari repository ke variable global class BLoC
        listPegawai = value;
      }

      /// Jalankan notifylistener berfungsi sebagai pembuat ulang state nya sistemnya sama seperti setState
      notifyListeners();
    });
  }

  /// Function Add Data
  void addData(context, Pegawai pegawai) {
    pegawaiRepo.addPegawai(pegawai).then((value) {
      if (value != null) {
        /// Kembali ke Home Screen setelah berhasil update dengan membawa nilai true
        Navigator.pop(context, true);
      } else {
        Navigator.pop(context);
      }
    });
  }

  /// Function Update Data
  void updateData(context, Pegawai pegawai) {
    pegawaiRepo.updatePegawai(pegawai).then((value) {
      if (value != null) {
        Navigator.pop(context, true);
      } else {
        Navigator.pop(context);
      }
    });
  }


  /// Function Delete Data
  void deleteData(int index, Pegawai pegawai) {
    pegawaiRepo.deletePegawai(pegawai).then((value){
      if(value != null){
        /// Ketika Success Update Maka menghapus item dari daftar list dan UI
        listPegawai.removeAt(index);
      }
      notifyListeners();
    });
  }

  void rebuildData()async{
    listPegawai = [];
    notifyListeners();
    getData();
  }
}
