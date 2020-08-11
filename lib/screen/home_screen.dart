import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud/bloc/bloc_pegawai.dart';
import 'package:simple_crud/model/pegawai_model.dart';
import 'package:simple_crud/screen/add_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BlocPegawai()),
      ],
      child: Consumer<BlocPegawai>(
        builder: (context, blocPegawai, _) => Scaffold(
          appBar: AppBar(
            title: Text("Simple Crud"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddScreen(
                                title: "Add Pegawai",
                                blocPegawai: blocPegawai,
                              )));
                  if (result != null) {
                    blocPegawai.rebuildData();
                  }
                },
              ),
            ],
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: blocPegawai.listPegawai.length == 0
                ? blocPegawai.isLoading == true
                    ? Center(child: CircularProgressIndicator())
                    : Center(child: Text("Data Kosong"))
                : ListView.builder(
                    itemCount: blocPegawai.listPegawai.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      Pegawai data = blocPegawai.listPegawai[index];
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          margin: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Nama",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500)),
                              Text(data?.nama ?? "",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500)),
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Pekerjaan",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500)),
                                          Text(data?.posisi ?? "",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Salary",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500)),
                                          Text("\$ ${data?.gaji ?? 0}",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Container(
                                      height: 45,
                                      margin:
                                          EdgeInsets.only(right: 4, top: 10),
                                      width: double.infinity,
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        textColor: Colors.white,
                                        color: Colors.green,
                                        child: Text("Update"),
                                        onPressed: () async {
                                          var result = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddScreen(
                                                        title: "Update Pegawai",
                                                        data: data,
                                                        blocPegawai:
                                                            blocPegawai,
                                                      )));
                                          if (result != null) {
                                            blocPegawai.rebuildData();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 4, top: 10),
                                      height: 45,
                                      width: double.infinity,
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        textColor: Colors.white,
                                        color: Colors.red,
                                        child: Text("Delete"),
                                        onPressed: () {
                                          blocPegawai.deleteData(index, data);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
