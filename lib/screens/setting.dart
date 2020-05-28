 
import 'package:flutter/material.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // Explocit
  final formKey = GlobalKey<FormState>();
  String _txtcontain,_txttoadd;
  SharedPreferences prefs;

  @override
  void initState() { 
    super.initState(); 
    getSetting();
  }

  void saveSetting() async{
    prefs =await SharedPreferences.getInstance();  
    prefs.setString('_txtcontain', _txtcontain);
    prefs.setString('_txttoadd', _txttoadd);
    _txtcontain =prefs.getString('_txtcontain');
    _txttoadd =prefs.getString('_txttoadd');
  }

  void getSetting() async{
    prefs =await SharedPreferences.getInstance(); 
    setState(() {
      _txtcontain = prefs.getString('_txtcontain') ?? "";
      _txttoadd = prefs.getString('_txttoadd') ?? "";
      print('_txtcontain = $_txtcontain'); 
      print('_txttoadd = $_txttoadd');
      }
    );
  }

  //Method
  Widget registerButton()  {
    return IconButton(
      icon: Icon(Icons.save),
      iconSize: 40.0,
      color: Colors.blue,
      onPressed: () {
        print(' You click upload ');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('you enter _txtcontain = $_txtcontain');
          saveSetting();
        }
      },
    );
  }
  Widget enterContain(){
    return TextFormField(
      initialValue: _txtcontain,
      style: TextStyle(
        color: Colors.blue,
      ),
      decoration: InputDecoration(
          icon: Icon(
            Icons.text_fields,
            color: Colors.blue,
            size: 24.0,
          ),
          labelText: 'If QR contain:',
          labelStyle: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            ),
          ),
          onSaved: (String value){
          _txtcontain = value;
          },
    );
  }
  Widget enterAddString(){
    return TextFormField(
      initialValue: _txttoadd,
      style: TextStyle(
        color: Colors.blue,
      ),
      decoration: InputDecoration(
          icon: Icon(
            Icons.add_comment,
            color: Colors.blue,
            size: 24.0,
          ),
          labelText: 'Add String:',
          labelStyle: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            ),
          ),
          onSaved: (String value){
          _txttoadd = value;
          },
    );
  }



  Widget enterSetting() {  
    return Column(
      children: <Widget>[ 
        SizedBox(height: 30.0),   
        enterContain(),
        SizedBox(height: 30.0),   
        enterAddString(),
        SizedBox(height: 30.0),  
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text('Register'),
      ),
      body: Form(key: formKey,
              child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[ 
            enterSetting(), 
            registerButton(),
          ],
        ),
      ),
    );
  }
 
}