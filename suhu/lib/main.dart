
import 'package:flutter/material.dart';
import 'widgets/input.dart';
import 'widgets/result.dart';
import 'widgets/convert.dart';
import 'widgets/riwayat.dart';
import 'widgets/dropdownconversi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  double _fahrenheit = 0;
  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else if(_newValue == "Reamur")
        _result = (4 / 5) * _inputUser;
      else
        _result = ((9 / 5)  * _inputUser);
    });
    listViewItem.add("$_newValue : $_result");
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      perhitunganSuhu();
    });
  }

  List<String> listViewItem = List<String>();

  var listItem = ["Kelvin", "Reamur", "Fahrenheit"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(inputUserController: inputController),
              DropdownConversi(listItem: listItem, newValue: _newValue, dropdownOnChanged : dropdownOnChanged),
              Result(result: _result),
              Convert(konvertHandler: perhitunganSuhu,),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded( //memenuhi ruang kosong
                child: Riwayat(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
