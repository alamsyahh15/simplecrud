import 'package:flutter/material.dart';
import 'package:simple_crud/bloc/bloc_pegawai.dart';
import 'package:simple_crud/model/pegawai_model.dart';

class AddScreen extends StatefulWidget {
  final String title;
  Pegawai data;
  BlocPegawai blocPegawai;
  AddScreen({this.title, this.data, this.blocPegawai});

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data == null) {
      /// Jikalau dia dari button add maka default data nya null
      /// Maka dari itu kita set agar dia modelnya tidak null set menjadi kosong
      widget.data = Pegawai();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title} Screen"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Nama Pegawai",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            TextFormField(
              initialValue: widget?.data?.nama ?? "",
              onChanged: (value) => widget?.data?.nama = value,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            SizedBox(height: 8),
            Text(
              "Jabatan Pegawai",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            TextFormField(
              initialValue: widget?.data?.posisi ?? "",
              onChanged: (value) => widget?.data?.posisi = value,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            SizedBox(height: 8),
            Text(
              "Gaji Pegawai",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            TextFormField(
              initialValue: "${widget?.data?.gaji ?? ""}",
              onChanged: (value) => widget?.data?.gaji = value,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Container(
            height: 45,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: Colors.green,
              textColor: Colors.white,
              child: Text("${widget.title}"),
              onPressed: () {
                /// Jika judul mempunyai kata "update" maka akan menjalankan func update 
                /// selain itu jalankan func add
                if (widget.title.toLowerCase().contains("update")) {
                  widget.blocPegawai.updateData(context, widget.data);
                } else {
                  widget.blocPegawai.addData(context, widget.data);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
